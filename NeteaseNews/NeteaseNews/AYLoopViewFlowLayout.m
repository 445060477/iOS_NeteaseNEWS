//
//  AYLoopViewFlowLayout.m
//  NeteaseNews
//
//  Created by yws on 16/4/16.
//  Copyright © 2016年 yws. All rights reserved.
//

#import "AYLoopViewFlowLayout.h"

@implementation AYLoopViewFlowLayout

- (void)prepareLayout{
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
 
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
}
@end
