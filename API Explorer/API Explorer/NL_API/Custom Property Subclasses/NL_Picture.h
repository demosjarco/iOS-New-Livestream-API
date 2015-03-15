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
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSURL *thumb_url;
@property (nonatomic, strong) NSURL *small_url;
@property (nonatomic, strong) NSURL *medium_url;

@end