//
//  AppDelegate.m
//  API Explorer
//
//  Created by Victor Ilisei on 3/11/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.viewController = [[ViewController alloc] init];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end