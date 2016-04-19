//
//  AYNetworkTool.h
//  NeteaseNews
//
//  Created by yws on 16/4/16.
//  Copyright © 2016年 yws. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface AYNetworkTool : AFHTTPSessionManager

+ (instancetype)sharedNetworkTool;


@end
