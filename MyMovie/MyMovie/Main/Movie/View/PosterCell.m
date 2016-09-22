//
//  PosterCell.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "PosterCell.h"
#import "Movie.h"
#import "MovieDetailView.h"
@implementation PosterCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建大图
        [self _createView];
    }
    return self;
}
-(void)_createView{
    //1.创建图片视图
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width * 0.95, self.bounds.size.height * 0.95)];
    _imgView.center = self.contentView.center;
    [self.contentView addSubview:_imgView];
    
    //2.电影详情页面
    _detailView = [[[NSBundle mainBundle]loadNibNamed:@"MovieDetailView" owner:self options:nil]lastObject];
    
    _detailView.backgroundColor = [UIColor blueColor];
    _detailView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    _detailView.center = self.contentView.center;
    [self.contentView insertSubview:_detailView belowSubview:_imgView];
    
}
-(void)flipCell{
    UIViewAnimationOptions transition = left ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    //可能父视图里面有许多子视图，我们要交换的子视图索引不一定索引0和1
    NSInteger index1 = [self.contentView.subviews indexOfObject:_imgView];
    NSInteger index2 = [self.contentView.subviews indexOfObject:_detailView];
    
    [UIView transitionWithView:self.contentView duration:.5 options:transition animations:^{
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
    } completion:NULL];
    
    left = !left;
    _isFilp = !_isFilp;
    
}
-(void)setMovie:(Movie *)movie{
    if (_movie != movie) {
        _movie = movie;
        //填充数据
        NSString *urlString = [movie.images objectForKey:@"large"];
        
        //加载网络图片
        [_imgView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:[UIImage imageNamed:@"pig"]];
        
        [_detailView setMovie:movie];
        
    }
}


@end
