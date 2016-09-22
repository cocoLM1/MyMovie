//
//  MainNavigationController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *textAtt = @{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont systemFontOfSize:20]};
    self.navigationBar.titleTextAttributes = textAtt;
    
}
//修改状态栏
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
