//
//  PHIEngine.m
//  AFNetworking
//
//  Created by  on 2018/4/17.
//

#import "PHIEngine.h"
#import <Objc/runtime.h>
@interface PHIEngine ()
@property (nonatomic, strong) NSMutableArray<id<PHIEngineDelegate>> *engineReceivers;
@property (nonatomic, strong) NSMutableDictionary *engineReceiversDic;
@end

@implementation PHIEngine

+ (PHIEngine *)shared {
    static PHIEngine *shareEngine;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareEngine = [PHIEngine new];
    });

    return shareEngine;
}

- (void)dealloc {
    [self.engineReceivers enumerateObjectsUsingBlock:^(id<PHIEngineDelegate> _Nonnull service, NSUInteger idx, BOOL *_Nonnull stop) {
        [self removeReceiver:service];
    }];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.engineReceivers = [NSMutableArray new];
        self.engineReceiversDic = [NSMutableDictionary new];
        self.engineQuene = dispatch_queue_create("com.phicomm.engine.quene", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (NSArray<id<PHIEngineDelegate>> *)services {
    return self.engineReceivers;
}

/**********************************************************************/
#pragma mark - Private
/**********************************************************************/
//runtime消息转发机制，继承自 NSObject 的类可以覆盖这个方法,由于self.engineReceivers中元素PHIAMapConfigurator等遵守了PHIEngineDelegate协议，但是没有遵守UIApplicationDelegate协议，所以用到了消息转发机制
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    [self.engineReceivers enumerateObjectsUsingBlock:^(id<PHIEngineDelegate> _Nonnull service, NSUInteger idx, BOOL *_Nonnull stop) {
        if ([service respondsToSelector:anInvocation.selector]) {
            NSLog(@"[%@ %@]", service, NSStringFromSelector(anInvocation.selector));
            [anInvocation invokeWithTarget:service];
        }
    }];
}

/**********************************************************************/
#pragma mark - Public
/**********************************************************************/
- (void)addReceiver:(id<PHIEngineDelegate>)receiver {
    NSAssert(receiver, @"注册接收器失败，该接收器不存在");
    NSAssert([[receiver class] receiverName], @"缺少接收器对应的属性名称");

    if ([self.services containsObject:receiver]) {
        NSLog(@"注册接收器失败，该接收器实例对象已被注册");
        return;
    }
    //获取类名
    NSString *proName = receiver.receiverName;
    NSUInteger index = 0;
    if (self.engineReceivers.count != 0) {
        NSUInteger receiverPriority = 1000;
        if ([receiver respondsToSelector:@selector(receiverPriority)]) {
            receiverPriority = [receiver receiverPriority];
        }

        //排序
        for (NSUInteger i = self.engineReceivers.count - 1; i > 0; i--) {
            NSUInteger lastPriority = 1000;
            id<PHIEngineDelegate> lastService = [self.engineReceivers objectAtIndex:i];
            if ([lastService respondsToSelector:@selector(receiverPriority)]) {
                lastPriority = [lastService receiverPriority];
            }

            if (receiverPriority < lastPriority) {
                continue;
            }

            index = i;
            break;
        }
    }

    [self.engineReceivers insertObject:receiver atIndex:index];
    [self.engineReceiversDic setObject:receiver forKey:proName];

    NSLog(@"已注册接收器--->:%@", receiver);
}
- (id<PHIEngineDelegate>)getReceiverByName:(NSString *)receiverName {
    return [self.engineReceiversDic objectForKey:receiverName];
}
- (void)removeReceiver:(id<PHIEngineDelegate>)receiver {
    if (!receiver) {
        NSLog(@"注销接收器失败，该接收器为空");
        return;
    }
    if (![self.services containsObject:receiver]) {
        NSLog(@"注销接收器失败，该接收器已被注销");
        return;
    }
    [self.engineReceivers removeObject:receiver];
    [self.engineReceiversDic removeObjectForKey:receiver.receiverName];
    NSLog(@"WQEngine--->已注销接收器:%@", receiver);
}

- (void)removeReceiverByName:(NSString *)receiverName {
    id<PHIEngineDelegate> service = [self.engineReceiversDic objectForKey:receiverName];
    [self removeReceiver:service];
}

@end
