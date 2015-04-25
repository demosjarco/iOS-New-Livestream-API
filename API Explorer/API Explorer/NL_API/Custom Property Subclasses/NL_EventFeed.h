//
//  NL_EventFeed.h
//  API Explorer
//
//  Created by Victor Ilisei on 4/24/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NL_EventFeed : NSObject

@property (nonatomic, strong) NSNumber *total;
@property (nonatomic, strong) NSArray *data;

@end