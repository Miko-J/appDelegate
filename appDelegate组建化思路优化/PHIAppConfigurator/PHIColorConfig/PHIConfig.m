//
//  PHIConfig.m
//  appDelegate组建化思路优化
//
//  Created by niujinfeng on 2018/6/14.
//  Copyright © 2018年 niujinfeng. All rights reserved.
//

#import "PHIConfig.h"

@interface PHIConfig()
@property (nonatomic, copy) PHIConfigStringBlock string;
@property (strong, nonatomic) NSMutableDictionary *configDic;
@property (strong, nonatomic) NSString *configName;
@end
@implementation PHIConfig

- (instancetype)initWithName:(NSString *)configName {
    self = [super init];
    if (self) {
        self.configName = configName;
        [self initBlock];
        [self loadConfig];
    }
    return self;
}

+ (nullable instancetype)configWithName:(NSString *)configName {
    return [[self alloc] initWithName:configName];
}

/**********************************************************************/
#pragma mark - Private
/**********************************************************************/
- (void)initBlock {
    __weak typeof(self) __weakSelf = self;
    self.string = ^NSString * _Nullable(NSString * _Nonnull key) {
        id obj = __weakSelf.configDic[key];
        if ([obj isKindOfClass:[NSString class]]) {
            return obj;
        }
        return nil;
    };
}

- (NSURL *)urlWithName:(NSString *)configName {
    NSURL *fileURL = nil;
    BOOL isDirectory = NO;
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [cachePath stringByAppendingPathComponent:configName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory] && !isDirectory) {
        fileURL = [NSURL fileURLWithPath:filePath];
    } else {
        fileURL = [[NSBundle mainBundle] URLForResource:configName withExtension:nil];
        if (![[NSFileManager defaultManager] fileExistsAtPath:fileURL.path isDirectory:&isDirectory] || isDirectory) {
            NSAssert(NO, @"%@", [configName stringByAppendingString:@"配置文件未找到"]);
        }
    }
    return fileURL;
}

- (BOOL)loadConfig {
    NSURL *configUrl = [self urlWithName:self.configName];
    NSAssert(configUrl, @"未读取到配置文件!");
    if (!configUrl) {
        return NO;
    }
    NSMutableDictionary *configDic = [NSMutableDictionary dictionaryWithContentsOfURL:configUrl];
    //可以没有颜色配置
    //    NSAssert(configDic, @"未读取到配置文件!");
    //    if (!configDic) {
    //        return NO;
    //    }
    self.configDic = configDic;
    return YES;
}

/**********************************************************************/
#pragma mark - Public
/**********************************************************************/
- (BOOL)saveConfig {
    NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [cachePath stringByAppendingPathComponent:self.configName];
    return [self.configDic writeToFile:filePath atomically:YES];
}
@end

/**********************************************************************/
#pragma mark - PHIColorConfig
/**********************************************************************/

@interface PHIColorConfig()
@property (nonatomic, copy) PHIColorConfigBlock color;
@end

@implementation PHIColorConfig

+ (nullable instancetype)configWithName:(NSString *)configName {
    PHIColorConfig* colorConfig =  [super configWithName:configName];
    [colorConfig initColorConfigBlock];
    
    return colorConfig;
}

static inline NSUInteger hexStrToInt(NSString *str) {
    uint32_t result = 0;
    sscanf([str UTF8String], "%X", &result);
    return result;
}

static BOOL hexStrToRGBA(NSString *str,
                         CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    str = [str stringByTrimmingCharactersInSet:set];
    str = [str uppercaseString];
    if ([str hasPrefix:@"#"]) {
        str = [str substringFromIndex:1];
    } else if ([str hasPrefix:@"0X"]) {
        str = [str substringFromIndex:2];
    }
    
    NSUInteger length = [str length];
    //         RGB            RGBA          RRGGBB        RRGGBBAA
    if (length != 3 && length != 4 && length != 6 && length != 8) {
        return NO;
    }
    
    //RGB,RGBA,RRGGBB,RRGGBBAA
    if (length < 5) {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if (length == 4)  *a = hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0f;
        else *a = 1;
    } else {
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if (length == 8) *a = hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        else *a = 1;
    }
    return YES;
}

-(void)initColorConfigBlock {
    __weak typeof(self) weakSelf = self;
    self.color = ^UIColor * _Nullable (NSString * _Nonnull key) {
        NSString *hexStr = weakSelf.string(key);
        CGFloat r, g, b, a;
        if (hexStrToRGBA(hexStr, &r, &g, &b, &a)) {
            return [UIColor colorWithRed:r green:g blue:b alpha:a];
        }
        else {
            return nil;
        }
    };
}

@end
