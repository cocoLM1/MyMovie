//
//  ImageListController.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "BaseViewController.h"

@interface ImageListController : BaseViewController
{
    __weak IBOutlet UICollectionView *_collectionView;
    
}
@property(nonatomic,strong)NSMutableArray *data;
@end
