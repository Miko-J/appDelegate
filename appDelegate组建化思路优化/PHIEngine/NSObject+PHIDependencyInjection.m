//
//  NSObject+PHIDependencyInjection.m
//  PHIFramework
//
//  Created by 朱衡 on 2018/6/15.
//

#import "NSObject+PHIDependencyInjection.h"

@implementation NSObject (PHIDependencyInjection)

- (id)initWithParams:(NSDictionary *)params
{
    self = [self init];
    if (self) {
        [self injection:params];
    }
    return self;
}

- (void)injection:(NSDictionary *)params {
    [params.allKeys enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        SEL selector = NSSelectorFromString([NSString stringWithFormat:@"set%@%@:", [[obj substringToIndex:1] uppercaseString], [obj substringFromIndex:1]]);
        id value = [params objectForKey:obj];

        if ([self respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:selector withObject:value];
#pragma clang diagnostic pop
        } else {
            @try {
                [self setValue:value forKeyPath:obj];
            }
            @catch (NSException *exception) {
                NSLog(@"exception : %@", exception);

            }
            @finally {
            }
        }
    }];
}

@end
