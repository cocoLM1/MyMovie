//
//  MainTabBarController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "MainTabBarController.h"
#import "NewTabBarItem.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    
}

//用故事版创建的话，会在移除之后重新添加上去
-(void)viewWillAppear:(BOOL)animated{
    
    //先调用父类的viewWillAppear方法
    [super viewWillAppear:YES];
    [self _createTabbar];
    
}

-(void)_createTabbar{
    //1.移除所有的标签项
    for (UIView *view in self.tabBar.subviews) {
        
        Class cls = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cls]) {
            [view removeFromSuperview];
        }
    }
    NSArray *imgArr = @[@"movie_home",@"msg_new",@"start_top250@2x",@"icon_cinema",@"more_setting"];
    NSArray *titleArr = @[@"电影",@"新闻",@"top250",@"影院",@"更多"];
    
    
    CGFloat buttonWidth = KScreenWidth / imgArr.count;
    CGFloat buttonHeight = CGRectGetHeight(self.tabBar.frame);
    
    if (_selectImg == nil) {
        //1.创建阴影遮罩视图
        _selectImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 55, 45)];
        
        //2.添加图片
        _selectImg.image = [UIImage imageNamed:@"selectTabbar_bg_all"];
        //3.添加到tabbar
        [self.tabBar addSubview:_selectImg];
    }
    
    for (int i = 0; i < imgArr.count; i++) {
        NSString *imgName = imgArr[i];
        NSString *title = titleArr[i];
        
        
        //使用子类化的item来创建标签
        CGRect frame = CGRectMake(i*buttonWidth, 0, buttonWidth, buttonHeight);
        NewTabBarItem *item = [[NewTabBarItem alloc]initWithFrame:frame imageName:imgName title:title];
        [self.tabBar addSubview:item];
        item.tag = i + 100;
        
        //添加点击事件
        [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            _selectImg.center = item.center;
        }
    }
    
}
-(void)itemAction:(NewTabBarItem *)item{
    self.selectedIndex = item.tag - 100;
    //添加一个动画效果
    [UIView animateWithDuration:.25 animations:^{
        _selectImg.center = item.center;
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
