//
//  TopViewController.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    __weak IBOutlet UICollectionView *_collectionView;
}
@property(nonatomic,strong)NSMutableArray *data;

@end
