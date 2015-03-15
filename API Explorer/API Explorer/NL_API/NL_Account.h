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
#import "NL_AdCustomParams.h"
#import "NL_Follow.h"

@interface NL_Account : NSObject

@property (nonatomic) NSNumber *accountId;
@property (nonatomic, strong) NSString *full_name;
@property (nonatomic, strong) NSString *short_name;
@property (nonatomic, strong) NL_Picture *picture;
@property (nonatomic) BOOL is_beta_producer;
@property (nonatomic, strong) NSTimeZone *timezone;
@property (nonatomic, strong) NSString *accountDescription;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSDate *dob;
@property (nonatomic, strong) NSDate *created_at;
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
@property (nonatomic, strong) NSString *features_with_plan;
@property (nonatomic) BOOL is_searchable;
@property (nonatomic) BOOL is_public;
@property (nonatomic, strong) NSString *ad_account_id;
@property (nonatomic, strong) NSString *ad_provider_id;
@property (nonatomic, strong) NL_AdCustomParams *ad_custom_params;
@property (nonatomic) BOOL ad_enabled_for_vod;
@property (nonatomic) BOOL ad_enabled_for_live;
@property (nonatomic) BOOL ad_enabled_for_owner;
@property (nonatomic, strong) NSArray *ad_types;
@property (nonatomic) BOOL ad_enabled;
@property (nonatomic, strong) NL_Follow *followers;
@property (nonatomic, strong) NL_Follow *following;

- (void)populateAccountInBackground:(NSString *)customURL :(void (^)())succeededBlock :(void (^)(NSInteger statusCode, NSError *connectionError, NSError *jsonError))errorBlock;

- (void)getAccountPictureofSize:(CGFloat)sideLength :(void (^)(UIImage *image))completionBlock;

@end