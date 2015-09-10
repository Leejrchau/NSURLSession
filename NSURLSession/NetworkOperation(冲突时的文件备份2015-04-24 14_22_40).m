//
//  NetworkOperation.m
//  NSURLSession
//
//  Created by lizhichao on 15/1/6.
//  Copyright (c) 2015年 com.example. All rights reserved.
//

#import "NetworkOperation.h"

static NetworkOperation *shareNetworkOperation;

@implementation NetworkOperation

+(NetworkOperation *)shareNetworkOperation
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareNetworkOperation = [[NetworkOperation alloc]init];
    });
    return shareNetworkOperation;
}


#pragma mark NSURLSessionDataTask

+(void)loadDataOnURLSessionWithGetMethodWithURLString:(NSString *)urlString completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler
{
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        /*        operation  data      */
        completionHandler(data,response,error);
    }];
    // 启动请求任务
    [dataTask resume];
}

// post 请求方法
+(void)loadDataOnURLSessionWithPostMethodWithURLString:(NSString *)urlString withHttpHeaderDictionary:(NSDictionary *)HeaderDictionary completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler
{
    /*
    如果没有特殊格式的要求，一般要直接将get方法换成post方式：
     做法如下：
     
     1 首先：设置URL对象 对URL编码，并且创建request
            代码如下：
     
            NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
     
     2  设置HTTPHeaderField（这一步有的需要，有的不需要。有的app的后台接口需要post提交一个约定格式的form表单，那么我们有时候就需要拼接出来这个格式，这个具体格式得看具体的接口文档需求）
     
            代码如下：（下面只是以一个键值对为例，可能具体需求 需要拼接多个键值对）
            [request setValue:@"text/html; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
     
     3 设置http的请求方式：post 方式
            代码如下：
     
            [request setHTTPMethod:@"POST"];

     4 拼接httpBody ：
            具体做法如下：
            4.1（ 假设 get 方式中的url：@"http://api.map.baidu.com/telematics/v3/weather?location=成都&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8" .）
     
            4.2 将url 中的参数部分 ：@"location=成都&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8" 作为 post 的 httpBody .
     
            4.3  post 方式中的url 就是 @"http://api.map.baidu.com/telematics/v3/weather?"
     
            4.4 post 中的httpBody 字符串 就是：    NSString *body = @"location=成都&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8";
     
     5 给request 设置httpBody：
            代码如下：
     
            NSString *body = @"location=成都&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8";
            [request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];

     6 request设置完毕就可以发送请求了：
            代码如下：
     
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
                    completionHandler(data,response,error);
            }];
     
            // 启动请求
            [dataTask resume];

    */
    
}

#pragma mark NSURLSessionDownloadTask

-(NSURLSession *)session
{
    if(_session){
        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:nil];
    }
    return _session;
}








@end
