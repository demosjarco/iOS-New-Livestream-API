//
//  ViewController.m
//  API Explorer
//
//  Created by Victor Ilisei on 3/11/15.
//  Copyright (c) 2015 Tech Genius. All rights reserved.
//

#import "ViewController.h"

#import "NL_API.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NL_Account *psbnAccount = [[NL_Account alloc] init];
    
    [psbnAccount populateAccountInBackground:@"5145446" :^{
        // Succeeded
        NSLog(@"Succeeded");
    } :^(NSInteger statusCode, NSError *connectionError, NSError *jsonError) {
        // Fail
        NSLog(@"Failed %ld | %@ | %@", (long)statusCode, connectionError.localizedDescription, jsonError.localizedDescription);
    }];
}

@end