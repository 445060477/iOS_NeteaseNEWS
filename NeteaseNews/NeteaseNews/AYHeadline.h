//
//  AYHeadline.h
//  NeteaseNews
//
//  Created by yws on 16/4/16.
//  Copyright © 2016年 yws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AYHeadline : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;


+ (void)headlineWithSussess:(void(^)(NSArray *headline))success failed:(void(^)(NSError *error))failed;

+ (instancetype)headLineWithDict:(NSDictionary *)dict;

@end
