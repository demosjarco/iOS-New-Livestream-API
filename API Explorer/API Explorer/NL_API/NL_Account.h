//
//  NL_Account.h
//  API Explorer
//
//  Created by Victor Ilisei on 3/12/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "NL_Picture.h"
#import "NL_Events.h"
#import "NL_Devices.h"
#import "NL_PlanInfo.h"

@interface NL_Account : NSObject

@property (nonatomic) long accountId;
@property (nonatomic, strong) NSString *full_name;
@property (nonatomic, strong) NSString *short_name;
@property (nonatomic, strong) NL_Picture *picture;
@property (nonatomic) BOOL is_beta_producer;
@property (nonatomic, strong) NSTimeZone *timezone;
@property (nonatomic, strong) NSString *accountDescription;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSDate *dob;
@property (nonatomic) BOOL is_locked;
@property (nonatomic, strong) NL_Events *upcoming_events;
@property (nonatomic, strong) NL_Events *past_events;
@property (nonatomic, strong) NSArray *links;
@property (nonatomic, strong) NSString *google_analytics_id;
@property (nonatomic, strong) NSString *mixpanel_id;
@property (nonatomic, strong) NSString *signup_page;
@property (nonatomic, strong) NSString *signup_action;
@property (nonatomic, strong) NL_Devices *devices;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *category_name;
@property (nonatomic) BOOL privateAccount;
@property (nonatomic, strong) NSString *features;
@property (nonatomic, strong) NSNumber *plan_id;
@property (nonatomic, strong) NL_PlanInfo *plan_info;

- (void)populateAccountInBackground:(NSString *)customURL :(void (^)())succeededBlock :(void (^)(NSInteger statusCode, NSError *connectionError))errorBlock;

- (void)getAccountPictureofSize:(CGFloat)sideLength :(void (^)(UIImage *image))completionBlock;

@end