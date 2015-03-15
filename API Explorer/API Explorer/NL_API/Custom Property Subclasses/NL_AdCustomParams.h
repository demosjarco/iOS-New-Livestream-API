//
//  NL_AdCustomParams.h
//  API Explorer
//
//  Created by Victor Ilisei on 3/14/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NL_AdCustomParams : NSObject

@property (nonatomic, strong) NSString *accountId;
@property (nonatomic, strong) NSString *eventId;
@property (nonatomic, strong) NSString *live;
@property (nonatomic, strong) NSString *embedPath;
@property (nonatomic, strong) NSString *embedHost;

@end