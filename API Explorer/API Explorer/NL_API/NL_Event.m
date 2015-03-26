//
//  NL_Event.m
//  API Explorer
//
//  Created by Victor Ilisei on 3/12/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import "NL_Endpoints.h"

#import "NL_Event.h"

@implementation NL_Event

/*!
 @param customURLaccount ID or short_name of Livestream account
 @param customURLevent ID or short_name of a event
 */
- (void)populateEventInBackground:(NSString *)customURLevent fromAccount:(NSString *)customURLaccount :(void (^)())succeededBlock :(void (^)(NSInteger statusCode, NSError *connectionError, NSError *jsonError))errorBlock {
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[[[APIURL stringByAppendingPathComponent:ACCOUNT_ENDPOINT] stringByAppendingPathComponent:customURLaccount] stringByAppendingPathComponent:EVENT_ENDPOINT] stringByAppendingPathComponent:customURLevent]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        @autoreleasepool {
            NSHTTPURLResponse *correctResponse = (NSHTTPURLResponse *)response;
            if (connectionError) {
                errorBlock(correctResponse.statusCode, connectionError, nil);
            } else if (correctResponse.statusCode != 200) {
                errorBlock(correctResponse.statusCode, connectionError, nil);
            } else {
                @autoreleasepool {
                    NSError *jsonError;
                    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
                    if (jsonError) {
                        errorBlock(correctResponse.statusCode, connectionError, jsonError);
                    } else {
                        self.eventId = [json[@"id"] longValue];
                        
                        self.short_name = json[@"short_name"];
                        
                        self.full_name = json[@"full_name"];
                        
                        self.owner = json[@"owner"];
                        
                        self.logo = [[NL_Picture alloc] init];
                        self.logo.original_size = CGSizeMake([[json[@"logo"] objectForKey:@"original_width"] floatValue], [[json[@"logo"] objectForKey:@"original_height"] floatValue]);
                        self.logo.url = [json[@"logo"] objectForKey:@"url"];
                        self.logo.thumb_url = [json[@"logo"] objectForKey:@"thumb_url"];
                        self.logo.small_url = [json[@"logo"] objectForKey:@"small_url"];
                        self.logo.medium_url = [json[@"logo"] objectForKey:@"medium_url"];
                        
                        succeededBlock();
                    }
                }
            }
        }
    }];
}

/*!
 @param posterSize Give the size of the poster you want. (0, 0) will return largest size available.
 @note The image is square therefore it will have the same height as width and vice versa.
 @warning If you request an image size bigger than image exists, it will return the largest image size possible. Use @p posterSize.size to get size of returned image.
 */
- (void)getEventPosterofSize:(CGSize)posterSize :(void (^)(UIImage *image))completionBlock {
    if (posterSize.height == CGSizeZero.height && posterSize.width == CGSizeZero.width) {
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.logo.url]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (!connectionError && data) {
                completionBlock([UIImage imageWithData:data]);
            }
        }];
    } else {
        @autoreleasepool {
            NSString *ext = [self.logo.url pathExtension];
            NSString *url = [[NSString stringWithFormat:@"%@_%.fx%.f", [self.logo.url stringByDeletingPathExtension], posterSize.width, posterSize.height] stringByAppendingPathExtension:ext];
            
            [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                if (!connectionError && data) {
                    completionBlock([UIImage imageWithData:data]);
                }
            }];
        }
    }
}

@end