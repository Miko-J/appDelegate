//
//  PHIConfigService.m
//  appDelegate组建化思路优化
//
//  Created by niujinfeng on 2018/6/14.
//  Copyright © 2018年 niujinfeng. All rights reserved.
//

#import "PHIConfigService.h"
#import "PHIConfig.h"
NSString *const PHICOLOR_CONFIG_NAME = @"PHIColorConfig.plist";
@interface PHIConfigService()
@property (nonatomic, strong) id<ConfigAPI,ColorConfigApi> colorConfig;
@end
@implementation PHIConfigService

#pragma mark - private

- (instancetype)initWithParam:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.colorConfig = (id<ConfigAPI,ColorConfigApi>)[PHIColorConfig configWithName:dict[@"colorConfig"]];
    }
    return self;
}

+(PHIConfigService *)defaultConfigService {
    static PHIConfigService *defaultConfigService;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *dict = @{ @"colorConfig" : PHICOLOR_CONFIG_NAME };
        defaultConfigService = [[PHIConfigService alloc] initWithParam:dict];
    });
    return defaultConfigService;
}



@end
