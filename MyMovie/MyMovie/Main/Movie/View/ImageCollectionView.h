//
//  ImageCollectionView.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>

@property(nonatomic,assign)CGFloat pageWidth;//一页宽度
@property(nonatomic,strong)NSMutableArray *data;//接受psterview传递来的数据
@property(nonatomic,assign)NSInteger currentItem;//记录当前选中的单元格


@end
