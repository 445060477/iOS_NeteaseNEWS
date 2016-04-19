//
//  AYLoopView.m
//  NeteaseNews
//
//  Created by yws on 16/4/16.
//  Copyright © 2016年 yws. All rights reserved.
//

#import "AYLoopView.h"
#import "AYLoopViewFlowLayout.h"
#import "AYLoopViewCell.h"
@interface AYLoopView ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) NSArray *URLs;

@property (nonatomic, strong) NSArray<NSString *> *title;





@property (nonatomic, weak) UICollectionView *collectionV;

@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic, weak) UILabel *titleLabel;

//定时器
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation AYLoopView

- (instancetype)initWithURLs:(NSArray<NSURL *> *)URLs titles:(NSArray<NSString *> *)titles{
    if (self = [super init]) {
        self.URLs =URLs;
        self.pageControl.numberOfPages = self.URLs.count;
        
        self.titleLabel.text = titles[0];
        
        self.title = titles;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.URLs.count > 1) {
                [self.collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.URLs.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];

                [self addTimer];
            }
        });
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
        
    }
    

    return self;
}

- (void)setup{
    
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[AYLoopViewFlowLayout alloc] init]];
    collectionV.backgroundColor = [UIColor whiteColor];
    
    [collectionV registerClass:[AYLoopViewCell class]
    forCellWithReuseIdentifier:@"LoopViewCell"];
    
    collectionV.dataSource = self;
    collectionV.delegate = self;
    collectionV.pagingEnabled =YES;
    collectionV.showsHorizontalScrollIndicator = NO;
    
    
    
    [self addSubview:collectionV];
    
    self.collectionV = collectionV;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    self.titleLabel = titleLabel;
    titleLabel.font = [UIFont systemFontOfSize:17.0];
    titleLabel.tintColor = [UIColor grayColor];
    [self addSubview:titleLabel];
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    self.pageControl = pageControl;
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [self addSubview:pageControl];
    
    
  
    
}

- (void)removeTimer{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)addTimer{
    if (self.timer) return;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(updata) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)updata{
    NSInteger page = (CGFloat)self.collectionV.contentOffset.x / self.collectionV.frame.size.width + 0.5;
    
    CGFloat offset = (page+1) *self.collectionV.frame.size.width;
    
    [self.collectionV setContentOffset:CGPointMake(offset, 0) animated:YES];
}


#pragma mark- 布局子控件

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat titleH = 17.0;
    
    CGRect frame = self.bounds;
    frame.size.height -= titleH;
    self.collectionV.frame  = frame;
   
    
    //title
    
    CGFloat margin = 20.0;
    CGFloat pageW = 40.0;
    CGFloat pageX = frame.size.width - margin -pageW;
    
    CGFloat titleX = margin *0.5;
    CGFloat titleY = frame.size.height;
    CGFloat titleW =pageX - margin -titleX;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
     //page
    
    CGFloat pageY = titleY;
    
    
    self.pageControl.frame = CGRectMake(pageX, pageY, pageW, titleH);
    


   

}


#pragma mark- CollectionView 数据源方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.URLs.count*3;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    AYLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LoopViewCell"
                                                                     forIndexPath:indexPath];
    
    
    cell.url = [NSURL URLWithString:self.URLs[indexPath.item % self.URLs.count]];
    
    
    return cell;
}




#pragma mark- scrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = (CGFloat)self.collectionV.contentOffset.x/self.collectionV.frame.size.width+0.5;
    
    
    self.titleLabel.text =self.title[page %self.URLs.count];
    
    self.pageControl.currentPage = page % self.URLs.count;
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x /self.frame.size.width ;
    
                                                 //第0组的item个数
    if (page ==0 || page == ([self.collectionV numberOfItemsInSection:0] -1)) {
        CGFloat offsetX = (self.URLs.count - ((page ==0)? 0:1))*scrollView.frame.size.width;
        self.collectionV.contentOffset = CGPointMake(offsetX, 0);
    }
//    NSLog(@"第%zd张",page);
    
    //开启定时器
    [self addTimer];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
}



@end
