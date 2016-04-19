//
//  AYNetworkTool.m
//  NeteaseNews
//
//  Created by yws on 16/4/16.
//  Copyright © 2016年 yws. All rights reserved.
//

#import "AYNetworkTool.h"

@implementation AYNetworkTool

+ (instancetype)sharedNetworkTool{
    
    static AYNetworkTool *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString: @"http://c.m.163.com/nc/ad/"];
        instance = [[self alloc] initWithBaseURL:baseURL];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
        
    });
    
    
    return instance;
}


@end
