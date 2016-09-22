//
//  PosterCell.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@class MovieDetailView;
@interface PosterCell : UICollectionViewCell
{
    UIImageView *_imgView;
    
    MovieDetailView *_detailView;//详情页面
    
    BOOL left;//判断是否翻转
}
@property(nonatomic,strong)Movie *movie;
@property(nonatomic,assign)BOOL isFilp;
//单元格的翻转方法
-(void)flipCell;
@end
