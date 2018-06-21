//
//  PHIEngine.h
//  AFNetworking
//
//  Created by  on 2018/4/17.
//

#import "PHIEngineDelegate.h"
#import <Foundation/Foundation.h>
#import "PHIAppConfigurator.h"

NS_ASSUME_NONNULL_BEGIN

@interface PHIEngine : NSObject <UIApplicationDelegate>

@property (class, readonly) PHIEngine *shared;
@property (readonly) NSArray<id<PHIEngineDelegate>> *services;
/**
 engineQuene是串行队列，多个任务会依次执行
 收到delegate事件后，如需放在子线程中处理。建议使用engineQuene
 */
@property (nonatomic, strong) dispatch_queue_t engineQuene;
/**
 添加一个接收器，添加后PHIEngine会持有它
 @param receiver 接收器实例
 */
- (void)addReceiver:(id<PHIEngineDelegate>)receiver;
- (id<PHIEngineDelegate>)getReceiverByName:(NSString *)receiverName;
- (void)removeReceiverByName:(NSString *)receiverName;

/**
 移除一个接收器，在接收器销毁前要先remove
 
 @param receiver  接收器实例
 */
- (void)removeReceiver:(id<PHIEngineDelegate>)receiver;
@end

NS_ASSUME_NONNULL_END
