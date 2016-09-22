//
//  PosterView.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PosterCollectionView;
@class IndexCollectionView;
@interface PosterView : UIView{
    //1.头部视图
    UIView *_headerView;
    
    //2.头部视图里面的索引海报视图
    IndexCollectionView *_indexcollectionView;
    
    //3.海报视图
    PosterCollectionView *_postercollectionView;
    
    //4.尾部视图
    UILabel *_footerLabel;
}
@property(nonatomic,strong)NSMutableArray *data;
@end
