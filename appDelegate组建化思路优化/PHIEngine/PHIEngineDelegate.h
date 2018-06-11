//
//  PHIEngineDelegate.h
//  PHIFramework
//
//  Created by 朱衡 on 2018/5/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class PHIEngine;

NS_ASSUME_NONNULL_BEGIN

#define PHIRECEIVER_NAMEED()                        \
    -(NSString *)receiverName {                     \
        return [[self class] receiverName];         \
    }                                               \
    +(NSString *)receiverName {                     \
        static NSString *name = nil;                \
        if (name == nil) {                          \
            name = NSStringFromClass([self class]); \
        }                                           \
        return name;                                \
    }

typedef NS_ENUM(NSInteger, PHIApplicationEvent) {
    PHIApplicationEvent_DidFinishLanch,
    PHIApplicationEvent_WillEnterForeground,
    PHIApplicationEvent_DidBecomeActive,
    PHIApplicationEvent_WillResignActive,
    PHIApplicationEvent_DidEnterBackground,
    PHIApplicationEvent_WillTerminate,
};
typedef void (^PHIAppEventCompletion)(PHIApplicationEvent appEvent);

@protocol PHIEngineDelegate <UIApplicationDelegate>

@required

//禁止new
- (instancetype)init __attribute__((unavailable("init not available, call defaultInstance instead")));
+ (instancetype) new __attribute__((unavailable("new not available, call defaultInstance instead")));

// 接收器名称
+ (NSString *)receiverName;
- (NSString *)receiverName;
//默认初始化方法
+ (instancetype)defaultInstance;

@optional
//自定义参数的初始化方法
- (instancetype)initWithParam:(NSDictionary *)dict;

//接收器优先级。越小优先级越高，同优先级先加入的先被初始化，默认是低优先级1000
- (NSUInteger)receiverPriority;

//系统事件处理完成后的回调

- (void)completionHandler:(void (^)(PHIApplicationEvent appEvent))completionHandler;

@end

NS_ASSUME_NONNULL_END
