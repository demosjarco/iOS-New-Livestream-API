//
//  NL_PlanInfo.h
//  API Explorer
//
//  Created by Victor Ilisei on 3/14/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NL_PlanInfo : NSObject

@property (nonatomic, strong) NSNumber *planId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *planDescription;
@property (nonatomic, strong) NSString *recurly_code;
@property (nonatomic, strong) NSString *features;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic) BOOL is_scoped;

@end