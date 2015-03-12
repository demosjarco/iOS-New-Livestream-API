//
//  NL_Account.h
//  API Explorer
//
//  Created by Victor Ilisei on 3/12/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NL_Account : NSObject

- (instancetype)initWithAccountId:(long)accId;

@property (nonatomic) long accountId;
@property (nonatomic, strong) NSString *short_name;
@property (nonatomic, strong) NSString *full_name;
@property (nonatomic, strong) NSString *picture_url;
@property (nonatomic, strong) NSString *accountDescription;
@property (nonatomic, strong) NSArray *upcoming_events;
@property (nonatomic, strong) NSArray *past_events;

- (void)populateAccountInBackground :(void (^)())succeededBlock :(void (^)(NSInteger statusCode, NSError *connectionError))errorBlock;

- (void)getAccountPictureofSize:(CGFloat)sideLength :(void (^)(UIImage *image))completionBlock;

@end