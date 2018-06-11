//
//  PHIBuglyConfigurator.m
//  appDelegate组建化思路优化
//
//  Created by niujinfeng on 2018/6/9.
//  Copyright © 2018年 niujinfeng. All rights reserved.
//

#import "PHIBuglyConfigurator.h"
#import "PHIEngine.h"
#import <Bugly/Bugly.h>
// 组件化后可去掉，使用 config services 获取初始配置
#import "PHIAppConfigurator.h"

@interface PHIBuglyConfigurator()

@property (nonatomic, copy) NSString *appKey;
@end

@implementation PHIBuglyConfigurator


#pragma mark - private
- (instancetype)initWithParam:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.appKey = [dict objectForKey:@"appKey"];
    }
    return self;
}

#pragma mark - PHIEngineDelegate
+ (instancetype)defaultInstance {
    NSDictionary *dict = @{ @"appKey" : BUGLY_APPID }; // 组件化后,通过config services 获取
    PHIBuglyConfigurator *bugly = [[PHIBuglyConfigurator alloc] initWithParam:dict];
    return bugly;
}

PHIRECEIVER_NAMEED();

#pragma mark - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    dispatch_async(PHIEngine.shared.engineQuene, ^{
        [Bugly startWithAppId:self.appKey];
    });
    
    return NO;
}
@end
