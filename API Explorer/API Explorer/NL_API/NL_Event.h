//
//  NL_Event.h
//  API Explorer
//
//  Created by Victor Ilisei on 3/12/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NL_Event : NSObject

@property (nonatomic) long eventId;
@property (nonatomic, strong) NSString *short_name;
@property (nonatomic, strong) NSString *full_name;
@property (nonatomic, strong) NSDictionary *owner;

@end