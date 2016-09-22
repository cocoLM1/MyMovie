//
//  IndexCollectionView.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCell.h"
#import "Movie.h"
@implementation IndexCollectionView
{
    NSString *identify;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        //注册单元格
        identify = @"IndexCell";
        [self registerClass:[IndexCell class] forCellWithReuseIdentifier:identify];
    }
    
    return self;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    IndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
    //传递数据用于单元格的显示
    Movie *movie = self.data[indexPath.item];
    NSString *url = [movie.images objectForKey:@"medium"];
    cell.url = url;
    
    return cell;
}
#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //先判断点击的单元格是不是当前选中单元格
    if (self.currentItem != indexPath.item) {
        //让选中的单元格居中显示
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        //记录当前页
        self.currentItem = indexPath.item;
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


@end
