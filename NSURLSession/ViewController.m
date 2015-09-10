//
//  ViewController.m
//  NSURLSession
//
//  Created by lizhichao on 15/1/6.
//  Copyright (c) 2015年 com.example. All rights reserved.
//

#import "ViewController.h"
#import "NetworkOperation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NetworkOperation loadDataOnURLSessionWithGetMethodWithURLString:@"http://api.map.baidu.com/telematics/v3/weather?location=成都&output=json&ak=rnm8udmHdWaHFWZTO2tuTiG8" completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        NSLog(@"get json %@",jsonObject);
        
    }];
    
    [NetworkOperation loadDataOnURLSessionWithPostMethodWithURLString:@"http://api.map.baidu.com/telematics/v3/weather?" withHttpHeaderDictionary:nil completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        
        id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        NSLog(@"post json %@",jsonObject);
        
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
