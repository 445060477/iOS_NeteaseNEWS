//
//  AYNews.h
//  NeteaseNews
//
//  Created by yws on 16/4/18.
//  Copyright © 2016年 yws. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AYNews : NSObject
/**
 *  新闻标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  新闻摘要
 */
@property (nonatomic, copy) NSString *digest;
/**
 *  新闻图片
 */
@property (nonatomic, copy) NSString *imgsrc;
/**
 *  跟帖数
 */
@property (nonatomic, copy) NSString *replyCount;




+ (void)loadNewsDataSuccess:(void(^)(NSArray *news))success failed:(void(^)(NSError *error))error;

@end
