//
//  AYNewsViewController.m
//  NeteaseNews
//
//  Created by yws on 16/4/18.
//  Copyright © 2016年 yws. All rights reserved.
//

#import "AYNewsViewController.h"
#import "AYNetworkTool.h"
#import "AYNews.h"

@interface AYNewsViewController ()

@property (nonatomic, strong) NSArray *news;



@end

@implementation AYNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [AYNews loadNewsDataSuccess:^(NSArray *news) {
        NSLog(@"%@",news);
    } failed:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
    
}


#pragma mark- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.news.count;
}



#pragma mark- UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    return cell;
}

    

@end
