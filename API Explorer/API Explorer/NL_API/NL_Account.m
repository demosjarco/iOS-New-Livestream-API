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
- (void)populateAccountInBackground:(NSString *)customURL :(void (^)())succeededBlock :(void (^)(NSInteger statusCode, NSError *connectionError))errorBlock {
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[[APIURL stringByAppendingPathComponent:ACCOUNT_ENDPOINT] stringByAppendingPathComponent:[NSString stringWithFormat:@"%ld", self.accountId]]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        @autoreleasepool {
            NSHTTPURLResponse *correctResponse = (NSHTTPURLResponse *)response;
            if (connectionError) {
                errorBlock(correctResponse.statusCode, connectionError);
            } else if (correctResponse.statusCode != 200) {
                errorBlock(correctResponse.statusCode, nil);
            } else {
                
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
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.picture.url.absoluteString]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (!connectionError && data) {
                completionBlock([UIImage imageWithData:data]);
            }
        }];
    } else if (sideLength > 0) {
        @autoreleasepool {
            NSString *ext = [self.picture.url.absoluteString pathExtension];
            NSString *url = [[NSString stringWithFormat:@"%@_%.fx%.f", [self.picture.url.absoluteString stringByDeletingPathExtension], sideLength, sideLength] stringByAppendingPathExtension:ext];
            
            [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                if (!connectionError && data) {
                    completionBlock([UIImage imageWithData:data]);
                }
            }];
        }
    }
}

@end