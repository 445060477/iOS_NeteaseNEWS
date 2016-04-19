//
//  AYHeadlineController.m
//  NeteaseNews
//
//  Created by yws on 16/4/16.
//  Copyright © 2016年 yws. All rights reserved.
//

#import "AYHeadlineController.h"

#import "AYHeadline.h"
#import "AYLoopView.h"

@interface AYHeadlineController ()

@property (nonatomic, strong) NSArray *headline;


@end

@implementation AYHeadlineController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [AYHeadline headlineWithSussess:^(NSArray *headline) {
        
        NSArray *imgs = [headline valueForKeyPath:@"imgsrc"];
        NSArray *title = [headline valueForKeyPath:@"title"];
        
        AYLoopView *loopV = [[AYLoopView alloc] initWithURLs:imgs
                                                      titles:title
                             ];
        
        loopV.frame = self.view.bounds;
        [self.view addSubview:loopV];
        
    } failed:^(NSError *error) {
        
    }];

    

    



}

@end
