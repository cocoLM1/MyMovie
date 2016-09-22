//
//  StarView.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    //金色✨
    UIView *_yellowView;
    //灰色✨
    UIView *_grayView;
}
@property(nonatomic,assign)CGFloat rating;//评分
@end
