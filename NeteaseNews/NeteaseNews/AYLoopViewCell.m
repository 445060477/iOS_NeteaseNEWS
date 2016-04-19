//
//  AYLoopViewCell.m
//  NeteaseNews
//
//  Created by yws on 16/4/16.
//  Copyright © 2016年 yws. All rights reserved.
//

#import "AYLoopViewCell.h"
#import <UIImageView+WebCache.h>

@interface AYLoopViewCell ()

@property (nonatomic, strong) UIImageView *imgV;

@end

@implementation AYLoopViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imgV = [[UIImageView alloc] init];
        
        [self addSubview:imgV];
        self.imgV = imgV;
        
    }
    return self;
}


- (void)setUrl:(NSURL *)url{
    _url = url;
    
    [self.imgV sd_setImageWithURL:url];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imgV.frame = self.bounds;
}
@end
