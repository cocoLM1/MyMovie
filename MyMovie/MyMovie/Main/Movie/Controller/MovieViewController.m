//
//  MoreViewController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "PosterView.h"
@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadNavigationItem];
    [self _loadTableView];
    [self _loadPosterView];
    [self _requestData];
}

#pragma mark - loadData
//读取数据
-(void)_requestData{
    NSDictionary *jsonDic = (NSDictionary *)[MovieDataService requestData:@"us_box.json"];
    _data = [[NSMutableArray alloc]init];
    
    NSArray *array = [jsonDic objectForKey:@"subjects"];
    for (NSDictionary *dic in array) {
        NSDictionary *subject = [dic objectForKey:@"subject"];
        
        Movie *movie = [[Movie alloc]init];
        movie.average = [[subject objectForKey:@"rating"]objectForKey:@"average"];
        movie.collect_count = [subject objectForKey:@"collect_count"];
        movie.images = [subject objectForKey:@"images"];
        movie.movieId = [subject objectForKey:@"id"];
        movie.title = [subject objectForKey:@"title"];
        movie.subtype = [subject objectForKey:@"subtype"];
        movie.year = [subject objectForKey:@"year"];
        movie.original_title = [subject objectForKey:@"original_title"];
        
        [_data addObject:movie];
    }
    //刷新tableview,重新读取数据
    [_tableView reloadData];
    
    //将数据传递给posterview
    [_posterView setData:_data];
    
    
}
//初始化海报视图
-(void)_loadPosterView{
    _posterView = [[PosterView alloc]initWithFrame:CGRectMake(0,0, KScreenWidth, KScreenHeight)];
    _posterView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _posterView.hidden = NO;
    
    [self.view addSubview:_posterView];
}
//初始化列表视图
-(void)_loadTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _tableView.hidden = YES;
    _tableView.rowHeight = 120;
    _tableView.separatorColor = [UIColor darkGrayColor];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    
    [self.view addSubview:_tableView];
}

-(void)_loadNavigationItem{
    //1. 创建翻转所用的父视图
    UIView *buttonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    //2.创建两侧两个翻转按钮
    UIButton *pButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [pButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [pButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    pButton.tag = 200;
    pButton.frame = buttonView.frame;
    pButton.hidden = NO;
    [buttonView addSubview:pButton];
    [pButton addTarget:self action:@selector(rightBarClickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *lButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [lButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [lButton setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    lButton.tag = 201;
    lButton.frame = buttonView.frame;
    lButton.hidden = YES;
    [buttonView addSubview:lButton];
    [lButton addTarget:self action:@selector(rightBarClickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //把父视图给页面右边的按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:buttonView];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

-(void)rightBarClickAction:(UIButton *)btn{
    //1.通过button.superview
    //拿到buttonView
    UIView *buttonView = self.navigationItem.rightBarButtonItem.customView;
    //切换两个按钮的显示
    UIButton *pButton = (UIButton *)[buttonView viewWithTag:200];
    UIButton *lButton = (UIButton *)[buttonView viewWithTag:201];
    pButton.hidden = !pButton.hidden;
    lButton.hidden = !lButton.hidden;
    [self flipView:buttonView left:pButton.hidden];
    
    //切换列表视图和海报视图
    _tableView.hidden = !_tableView.hidden;
    _posterView.hidden = ! _posterView.hidden;
    [self flipView:self.view left:pButton.hidden];
    
    
}

-(void)flipView:(UIView *)forView left:(BOOL)flag{
    //通过三目运算符去判断翻转方向
    UIViewAnimationOptions flip = flag ? UIViewAnimationOptionTransitionFlipFromLeft :
    UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:forView
                      duration:.5
                       options:flip
                    animations:^{
                        [forView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
                    } completion:NULL];
    
    
    
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"movieCell";
    static int i = 0;
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MovieCell" owner:self options:nil]lastObject];
        cell.textLabel.text = [NSString stringWithFormat:@"%i",i];
        i++;
    }
    
    //数据的传输
    cell.movie = _data[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
