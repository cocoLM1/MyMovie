//
//  MoreViewController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    self.tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor darkGrayColor];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self countCacheSize];
}

// 计算缓存大小 并显示
-(void)countCacheSize{
    NSUInteger fileSize = [[SDImageCache sharedImageCache]getSize];
    
    _countLabel.text = [NSString stringWithFormat:@"%.1f M",fileSize/1024.0/1024.0];
    
}

// 提示框
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"清空缓存" message:@"是否确定清空缓存?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

#pragma mark - UIAlertViewDelegate
// 清理缓存
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [[SDImageCache sharedImageCache]clearDisk];
        [self countCacheSize];
    }
}

// 布局
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}
@end
