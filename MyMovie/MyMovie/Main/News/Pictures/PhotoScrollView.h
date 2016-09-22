//
//  PhotoScrollView.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imgView;//用来玩的图片(放大，缩小)
}
@property(nonatomic,strong)NSURL *url;

@end
