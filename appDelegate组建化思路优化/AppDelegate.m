//
//  AppDelegate.m
//  appDelegate组建化思路优化
//
//  Created by niujinfeng on 2018/6/9.
//  Copyright © 2018年 niujinfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "PHIEngine.h"
#import "PHIBuglyConfigurator.h"
#import "PHIConfigService.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[PHIEngine shared] addReceiver:[PHIBuglyConfigurator defaultInstance]];
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [super applicationWillResignActive:application];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [super applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [super applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [super applicationDidBecomeActive:application];
   
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [super applicationWillTerminate:application];
}


@end
