//
//  PosterView.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "PosterView.h"
#import "Movie.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
#define KHeaderViewHeight 100//头部视图的高度
#define KFooterViewHeight 35//尾部视图的高度
@implementation PosterView
{
    //半透明遮罩视图，这个视图要能够响应用户的点击事件
    UIControl *_maskView;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //创建头部视图
        [self _createHeaderView];
        //创建中间大海报视图
        [self _createPosterCollectionView];
        //创建头部视图里面的索引海报
        [self _createIndexCollectionView];
        //创建尾部视图
        [self _createFooterView];
        
        [_postercollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        [_indexcollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:NULL];
        
    }
    return self;
}
#pragma mark - KVO 观察者方法
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object //被观察对象
                       change:(NSDictionary<NSString *,id> *)change   //属性值
                      context:(void *)context
{
    if ([keyPath isEqualToString:@"currentItem"]) {
        //取出里面的新值
        //从change字典中去取，取出的值是包装好的，要使用先转化成NSInteger
        NSNumber *newValue = [change objectForKey:@"new"];
        NSInteger item = [newValue integerValue];
        
        if (object == _postercollectionView && _indexcollectionView.currentItem != item) {
            //被观察的对象大图
            
            //把值给小图的currentItem
            _indexcollectionView.currentItem = item;
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            [_indexcollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }else if(object == _indexcollectionView && _postercollectionView.currentItem != item){
            //被观察的对象是小图
            //把值给大图
            _postercollectionView.currentItem = item;
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            [_postercollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        
        //修改电影标题
        Movie *moive = self.data[item];
        _footerLabel.text = moive.title;
        
    }
    
    
}


-(void)_createFooterView{
    _footerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height - 49 - KFooterViewHeight, KScreenWidth, KFooterViewHeight)];
    _footerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    _footerLabel.font = [UIFont systemFontOfSize:16];
    _footerLabel.textColor = [UIColor colorWithRed:0 green:0.5 blue:1 alpha:1];
    _footerLabel.textAlignment = NSTextAlignmentCenter;
    _footerLabel.text = @"iOS90班";
    [self addSubview:_footerLabel];
    
}
-(void)_createIndexCollectionView{
    _indexcollectionView = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KHeaderViewHeight)];
    
    //跟大海报视图不一样的只是这个单页的宽度大小
    _indexcollectionView.pageWidth = 75;
    [_headerView addSubview:_indexcollectionView];
}
-(void)_createHeaderView{
    //1.创建头部视图
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64 - KHeaderViewHeight, KScreenWidth,130)];
    _headerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_headerView];
    
    //2.设置背景图片
    UIImage *img = [UIImage imageNamed:@"indexBG_home"];
    
    //设置拉伸点
    img = [img stretchableImageWithLeftCapWidth:0 topCapHeight:2];//纵向拉伸
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 130)];
    imgView.image = img;
    
    [_headerView addSubview:imgView];
    
    //3.创建箭头按钮
    UIButton *arrowsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [arrowsButton setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [arrowsButton setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    arrowsButton.frame = CGRectMake((KScreenWidth - 10)/2, 130 - 20, 15, 15);
    [_headerView addSubview:arrowsButton];
    [arrowsButton addTarget:self action:@selector(arrowsAction:) forControlEvents:UIControlEventTouchUpInside];
    arrowsButton.tag = 100;
    
    //4.创建向下轻扫手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_showHeaderView)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
    
    //5.创建向上轻扫手势
    UISwipeGestureRecognizer *pan = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(_hideHeaderView)];
    pan.direction = UISwipeGestureRecognizerDirectionUp;
    
    
    [self addGestureRecognizer:pan];
    //
}
//2.创建海报视图
-(void)_createPosterCollectionView{
    _postercollectionView = [[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 64 + 30, KScreenWidth, self.height - 30 - KFooterViewHeight - 64 - 49)];
    
    //指定单元格的宽度
    _postercollectionView.pageWidth = 220;
    _postercollectionView.backgroundColor = [UIColor clearColor];
    [self insertSubview:_postercollectionView belowSubview:_headerView];
}

//传递数据给collectionview
-(void)setData:(NSMutableArray *)data{
    if (_data != data) {
        _data = data;
        [_postercollectionView setData:data];
        
        [_indexcollectionView setData:data];
        
        //显示第一个电影的标题
        if (data.count > 0) {
            Movie *movie = [data objectAtIndex:0];
            _footerLabel.text = movie.title;
        }
    }
}
-(void)arrowsAction:(UIButton *)btn{
    btn.selected =! btn.selected;
    if (btn.selected == YES) {//展开
        [self _showHeaderView];
    }else{//收起
        [self _hideHeaderView];
    }
}
#pragma mark - 隐藏、显示头部视图
//展开
-(void)_showHeaderView{
    //添加动画效果
    [UIView animateWithDuration:.5 animations:^{
        _headerView.transform = CGAffineTransformMakeTranslation(0, KHeaderViewHeight);
    }];
    if (_maskView == nil) {
        _maskView = [[UIControl alloc]initWithFrame:self.bounds];
        _maskView.backgroundColor = [UIColor colorWithWhite:0 alpha:.5];
        [_maskView addTarget:self action:@selector(maskAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self insertSubview:_maskView belowSubview:_headerView];
        
        
    }
    _maskView.hidden = NO;
    
    //修改按钮的状态
    UIButton *arrowsButton = (UIButton *)[_headerView viewWithTag:100];
    arrowsButton.selected = YES;
    
    
}
-(void)_hideHeaderView{
    [UIView animateWithDuration:.5 animations:^{
        _headerView.transform = CGAffineTransformIdentity;
    }];
    _maskView.hidden = YES;
    
    //修改按钮的状态
    UIButton *arrowsButton = (UIButton *)[_headerView viewWithTag:100];
    arrowsButton.selected = NO;
}

-(void)maskAction:(UIControl *)contorl{
    [self _hideHeaderView];
}


@end
