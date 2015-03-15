//
//  NL_Picture.h
//  API Explorer
//
//  Created by Victor Ilisei on 3/14/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NL_Picture : NSObject

@property (nonatomic) CGSize original_size;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *thumb_url;
@property (nonatomic, strong) NSString *small_url;
@property (nonatomic, strong) NSString *medium_url;

@end