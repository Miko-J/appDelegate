//
//  NJFRequest.h
//  appDelegate组建化思路优化
//
//  Created by niujinfeng on 2018/7/26.
//  Copyright © 2018年 niujinfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 以下Block的参数你根据自己项目中的需求来指定, 这里仅仅是一个演示的例子
 */


/**
  请求成功的block

 @param response 响应体数据
 */
typedef void(^NJFRequestSuccess)(id response);

/**
 请求失败的block

 @param error error
 */
typedef void(^NJFRequestFailure)(NSError *error);

@interface NJFRequest : NSObject

#pragma mark - 登陆退出

/** 登录*/
+ (NSURLSessionTask *)getLoginWithParameters:(id)parameters success:(NJFRequestSuccess)success failure:(NJFRequestFailure)failure;

/** 退出*/
+ (NSURLSessionTask *)getExitWithParameters:(id)parameters success:(NJFRequestSuccess)success failure:(NJFRequestFailure)failure;

@end
