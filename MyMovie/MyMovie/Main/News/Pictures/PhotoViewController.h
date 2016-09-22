//
//  PhotoViewController.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
{
    BOOL _isHide;
}
@property(nonatomic,strong)NSArray *urls;
@property(nonatomic,strong)NSIndexPath *indexPath;
@end

