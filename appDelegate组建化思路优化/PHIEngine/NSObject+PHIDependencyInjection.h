//
//  NSObject+PHIDependencyInjection.h
//  PHIFramework
//
//  Created by 朱衡 on 2018/6/15.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSObject (PHIDependencyInjection)

- (id)initWithParams:(NSDictionary *)params;
- (void)injection:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END

