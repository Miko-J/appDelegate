//
//  PHIEngine.h
//  AFNetworking
//
//  Created by  on 2018/4/17.
//

#import "PHIEngineDelegate.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PHIEngine : NSObject <UIApplicationDelegate>

@property (class, readonly) PHIEngine *shared;
@property (readonly) NSArray<id<PHIEngineDelegate>> *services;
@property (nonatomic, strong) dispatch_queue_t engineQuene;

- (void)addReceiver:(id<PHIEngineDelegate>)receiver;
- (id<PHIEngineDelegate>)getReceiverByName:(NSString *)receiverName;
- (void)removeReceiverByName:(NSString *)receiverName;

@end

NS_ASSUME_NONNULL_END
