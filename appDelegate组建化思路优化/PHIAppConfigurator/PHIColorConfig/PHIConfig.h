//
//  PHIConfig.h
//  appDelegate组建化思路优化
//
//  Created by niujinfeng on 2018/6/14.
//  Copyright © 2018年 niujinfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PHIAppConfigurator.h"
NS_ASSUME_NONNULL_BEGIN

@interface PHIConfig : NSObject<ConfigServiceAPI>
+ (nullable instancetype)configWithName:(NSString *)configName;
- (BOOL)loadConfig;
- (BOOL)saveConfig;
-(instancetype)init UNAVAILABLE_ATTRIBUTE;
+(instancetype)new UNAVAILABLE_ATTRIBUTE;
@end

@interface PHIColorConfig :PHIConfig <ColorConfigApi>
@end

NS_ASSUME_NONNULL_END
