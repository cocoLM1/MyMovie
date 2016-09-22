//
//  TopDetailViewController.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,copy)NSDictionary *detailData;
@property(nonatomic,strong)NSIndexPath *index;

@end
