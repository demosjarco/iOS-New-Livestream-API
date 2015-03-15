//
//  NL_Events.h
//  API Explorer
//
//  Created by Victor Ilisei on 3/14/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NL_Events : NSObject

@property (nonatomic, strong) NSNumber *before;
@property (nonatomic, strong) NSNumber *after;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSNumber *total;

@end