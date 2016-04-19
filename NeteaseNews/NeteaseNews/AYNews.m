//
//  AYNews.m
//  NeteaseNews
//
//  Created by yws on 16/4/18.
//  Copyright © 2016年 yws. All rights reserved.
//

#import "AYNews.h"
#import "AYNetworkTool.h"



@implementation AYNews

+ (instancetype)newsWithDict:(NSDictionary *)dict{
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    return obj;
    
    
    
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}


+ (void)loadNewsDataSuccess:(void (^)(NSArray *news))success failed:(void (^)(NSError *error))failed{
    NSAssert(success != nil, @"成功不能为空");
    [[AYNetworkTool sharedNetworkTool] GET:@"/nc/article/headline/T1348647853363/0-20.html"
                                parameters:nil
                                  progress:nil
                                   success:^(NSURLSessionDataTask * _Nonnull
                                             task, NSDictionary *responseObject) {
                                       
                                       NSString *rootKey = responseObject.keyEnumerator.nextObject;
                                       NSArray *news = responseObject[rootKey];
                                       NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:news.count];
                                       [news enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
                                           NSLog(@"-------------------------------%@",dict);
                                           [arrM addObject:[AYNews newsWithDict:dict]];
                                       }];
                                       
                                       success(arrM.copy);
                                   }
                                   failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                       if (error) {
                                           failed(error);
                                       }
                                   }];
    

}


@end
