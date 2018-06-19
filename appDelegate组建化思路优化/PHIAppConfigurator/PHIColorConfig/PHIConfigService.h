//
//  PHIConfigService.h
//  appDelegate组建化思路优化
//
//  Created by niujinfeng on 2018/6/14.
//  Copyright © 2018年 niujinfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PHIAppConfigurator.h"
#import "PHIEngineDelegate.h"
@interface PHIConfigService :NSObject<PHIEngineDelegate,ConfigServiceAPI>

+(PHIConfigService *)defaultConfigService;

@end
