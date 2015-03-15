//
//  NL_Account.m
//  API Explorer
//
//  Created by Victor Ilisei on 3/12/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import "NL_Endpoints.h"

#import "NL_Account.h"

@implementation NL_Account

/*!
 @param customURL ID or short_name of Livestream account
 */
- (void)populateAccountInBackground:(NSString *)customURL :(void (^)())succeededBlock :(void (^)(NSInteger statusCode, NSError *connectionError, NSError *jsonError))errorBlock {
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[APIURL stringByAppendingPathComponent:ACCOUNT_ENDPOINT] stringByAppendingPathComponent:customURL]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
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
                        self.accountId = [NSNumber numberWithLong:[json[@"id"] longValue]];
                        
                        self.full_name = json[@"full_name"];
                        
                        self.short_name = json[@"short_name"];
                        
                        self.picture = [[NL_Picture alloc] init];
                        self.picture.original_size = CGSizeMake([[json[@"picture"] objectForKey:@"original_width"] floatValue], [[json[@"picture"] objectForKey:@"original_height"] floatValue]);
                        self.picture.url = [json[@"picture"] objectForKey:@"url"];
                        self.picture.thumb_url = [json[@"picture"] objectForKey:@"thumb_url"];
                        self.picture.small_url = [json[@"picture"] objectForKey:@"small_url"];
                        self.picture.medium_url = [json[@"picture"] objectForKey:@"medium_url"];
                        
                        self.is_beta_producer = [json[@"is_beta_producer"] boolValue];
                        
                        self.timezone = [NSTimeZone timeZoneWithName:json[@"timezone"]];
                        
                        self.accountDescription = json[@"description"];
                        
                        self.gender = json[@"gender"];
                        
                        self.type = json[@"type"];
                        
                        if (![json[@"dob"] isKindOfClass:[NSNull class]]) {
                            @autoreleasepool {
                                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                                [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
                                self.dob = [dateFormatter dateFromString:json[@"dob"]];
                            }
                        }
                        
                        @autoreleasepool {
                            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
                            self.created_at = [dateFormatter dateFromString:json[@"created_at"]];
                        }
                        
                        self.is_locked = [json[@"is_locked"] boolValue];
                        
                        succeededBlock();
                    }
                }
            }
        }
    }];
}

/*!
 @param sideLength Give the side length of how big the image will be. 0 will return largest size available.
 @note The image is square therefore it will have the same height as width and vice versa.
 @warning If you request an image size bigger than image exists, it will return the largest image size possible. Use @p image.size to get size of returned image.
 */
- (void)getAccountPictureofSize:(CGFloat)sideLength :(void (^)(UIImage *image))completionBlock {
    if (sideLength == 0) {
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.picture.url]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (!connectionError && data) {
                completionBlock([UIImage imageWithData:data]);
            }
        }];
    } else if (sideLength > 0) {
        @autoreleasepool {
            NSString *ext = [self.picture.url pathExtension];
            NSString *url = [[NSString stringWithFormat:@"%@_%.fx%.f", [self.picture.url stringByDeletingPathExtension], sideLength, sideLength] stringByAppendingPathExtension:ext];
            
            [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                if (!connectionError && data) {
                    completionBlock([UIImage imageWithData:data]);
                }
            }];
        }
    }
}

@end