//
//  AYHeadline.m
//  NeteaseNews
//
//  Created by yws on 16/4/16.
//  Copyright © 2016年 yws. All rights reserved.
//

#import "AYHeadline.h"
#import "AYNetworkTool.h"
@interface AYHeadline ()



@end

@implementation AYHeadline


+ (instancetype)headLineWithDict:(NSDictionary *)dict{
    
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


+ (void)headlineWithSussess:(void (^)(NSArray *))success failed:(void (^)(NSError *))failed{
    NSAssert(success != nil, @"不能为空");
    [[AYNetworkTool sharedNetworkTool] GET:@"headline/0-4.html"
                                parameters:nil
                                  progress:nil
                                   success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *responseObject) {
//                                       NSLog(@"%@",responseObject);
                                       //获得字典的第一个Key
                                       NSString *rootKey = responseObject.keyEnumerator.nextObject;
                                       NSLog(@"%@----",responseObject.keyEnumerator);
                                       //根据Key获得数组
                                       NSArray *arr = responseObject[rootKey];
                                       //可变数组
                                       NSMutableArray *MArr = [NSMutableArray arrayWithCapacity:arr.count];
                                       //遍历数组
                                       [arr enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
                                           //添加到可变数组
                                           [MArr addObject:[AYHeadline headLineWithDict:dict]];
                                       }];
//                                       NSLog(@"%@",MArr);
                                       success(MArr.copy);
                                   }
                                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                       failed(error);
                                   }];
    
}








- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}








@end
