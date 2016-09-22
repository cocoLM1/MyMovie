//
//  NewsViewController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "NewsDetailViewController.h"
#import "ImageListController.h"

CGFloat imageHeight = 150;
@interface NewsViewController ()
{
    //头条图片
    UIImageView *_imgView;
    //头条新闻
    UILabel *_titleLabel;
    
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    [self _requestData];
    [self _createHeaderView];
    
    //设置导航栏占位置
    self.navigationController.navigationBar.translucent = NO;
}


-(void)_createHeaderView{
    //1.图片
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, imageHeight)];
    _imgView.backgroundColor = [UIColor purpleColor];
    [self.view insertSubview:_imgView belowSubview:_tableView];
    //2.图片label
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageHeight - 30,KScreenWidth , 30)];
    _titleLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:.3];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    [self.view insertSubview:_titleLabel belowSubview:_tableView];
    [self _loadHeaderViewData];
}
-(void)_loadHeaderViewData{
    if (_data.count > 0) {
        NewsModel *news = self.data[0];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"pig"]];
        _titleLabel.text = news.title;
    }
}
-(void)_requestData{
    _data = [NSMutableArray array];
    NSArray *jsonArr = (NSArray *)[MovieDataService requestData:@"news_list.json"];
    for (NSDictionary *dic in jsonArr) {
        NewsModel *news = [[NewsModel alloc]initContentWithDic:dic];
        
        
        [_data addObject:news];
    }
    
    //刷新表视图
    [_tableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifyHeaderNewsCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifyNewsCell" forIndexPath:indexPath];
    cell.news = self.data[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 150;
    }
    return 60;
}

#pragma mark - UIScrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //1.获取y轴的位移
    CGFloat offsetY = scrollView.contentOffset.y;
    
    //先判断是向上还是向下滑动
    if (offsetY > 0) {//向上滑动
        CGRect frame = _imgView.frame;
        frame.origin.y = -offsetY;
        _imgView.frame = frame;
        
        
    }else{
        //1.计算图片增大之后的一个高度
        //ABS是取绝对值
        CGFloat height = imageHeight + ABS(offsetY);
        
        //原宽度/原高度 ＝ 放大宽度/放大高度
        CGFloat width = KScreenWidth / imageHeight * height;
        
        CGRect frame = CGRectMake(-(width - KScreenWidth)/2, 0, width, height);
        _imgView.frame = frame;
        
    }
    
    CGRect frame = _titleLabel.frame;
    CGRect frame2 = _imgView.frame;
    frame.origin.y = CGRectGetMaxY(frame2)-_titleLabel.frame.size.height;
    _titleLabel.frame = frame;
    
}

//单元格的点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewsModel *news = self.data[indexPath.row];
    
    NSInteger type = [news.type integerValue];
    
    
    if (type == 0) {//文字新闻
        //根据storyboard ID 去取故事版中的控制器
        NewsDetailViewController *newsDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailViewController"];
        //PUSH
        [newsDetail setHidesBottomBarWhenPushed:YES];
        
        [self.navigationController pushViewController:newsDetail animated:YES];
        
    }else if (type == 1){//图片新闻
        ImageListController *imageList = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageListController"];
        //Push
        [imageList setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:imageList animated:YES];
        
    }
}


@end
