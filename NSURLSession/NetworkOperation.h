//
//  NetworkOperation.h
//  NSURLSession
//
//  Created by lizhichao on 15/1/6.
//  Copyright (c) 2015年 com.example. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkOperation : NSObject<NSURLSessionDownloadDelegate,NSURLSessionDelegate>

@property(nonatomic,strong)NSURLSession *session;
@property(nonatomic,strong)NSURLSessionDownloadTask *downloadTask;
@property(nonatomic,strong)NSData *resumeData;

+(NetworkOperation *)shareNetworkOperation;

+(void)loadDataOnURLSessionWithGetMethodWithURLString:(NSString *)urlString completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

+(void)loadDataOnURLSessionWithPostMethodWithURLString:(NSString *)urlString withHttpHeaderDictionary:(NSDictionary *)HeaderDictionary completionHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

@end
