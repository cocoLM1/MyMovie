//
//  PhotoCell.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PhotoScrollView;
@interface PhotoCell : UICollectionViewCell

@property(nonatomic,strong)PhotoScrollView *scrolView;
@property(nonatomic,copy)NSString *url;
@end
