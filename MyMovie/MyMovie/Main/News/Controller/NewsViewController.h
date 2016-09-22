//
//  NewsViewController.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *data;
@end
