//
//  PosterCollectionView.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCollectionView.h"
//在这里我们一定要实现布局对象的子协议，因为我们这里需要对collection进行布局（单元格的size）
@interface PosterCollectionView : ImageCollectionView

@end
