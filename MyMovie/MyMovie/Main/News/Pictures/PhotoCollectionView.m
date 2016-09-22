//
//  PhotoCollectionView.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "PhotoCollectionView.h"
#import "PhotoCell.h"
#import "PhotoScrollView.h"
@implementation PhotoCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    //CollectionView必须要有布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //设置滑动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //布局对象的尺寸
    flowLayout.itemSize = CGSizeMake(KScreenWidth, KScreenHeight);
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    
    if (self) {
        //设置当前对象的代理对象
        self.delegate = self;
        self.dataSource = self;
        self.pagingEnabled = YES;
        
        //设置竖直滚动方向，因为collection横向滑动
        flowLayout.minimumLineSpacing = 0;
        
        //注册单元格
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
    
}
#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.urls.count;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.url = self.urls[indexPath.row];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
    
}

//此方法获取到已经结束显示，也就是移除了的单元格
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *pCell = (PhotoCell *)cell;
    
    [pCell.scrolView setZoomScale:1.0 animated:YES];
}


@end
