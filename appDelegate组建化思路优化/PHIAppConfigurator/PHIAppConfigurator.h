//
//  PHIAppConfigurator.h
//  appDelegate组建化思路优化
//
//  Created by niujinfeng on 2018/6/9.
//  Copyright © 2018年 niujinfeng. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define Color(a) [PHIConfigService defaultConfigService].colorConfig.color(a);

NS_ASSUME_NONNULL_BEGIN
@interface PHIAppConfigurator : NSObject

UIKIT_EXTERN NSString * const BUGLY_APPID;

@end
//属性配置
typedef NSString * _Nullable (^PHIConfigStringBlock)(NSString *key);

//颜色配置
typedef UIColor * _Nullable (^PHIColorConfigBlock)(NSString *key);
@protocol ConfigAPI <NSObject>
@property (nonatomic, strong, readonly) NSMutableDictionary *configDic;

@end

@protocol ColorConfigApi <NSObject>
@property (nonatomic, copy, readonly) PHIColorConfigBlock color;
@end

@protocol ConfigServiceAPI <NSObject>
@property (nonatomic, strong, readonly) id<ConfigAPI,ColorConfigApi> colorConfig;
@end
NS_ASSUME_NONNULL_END


