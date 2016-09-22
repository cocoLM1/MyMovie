//
//  ImageListController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "ImageListController.h"
#import "NewsModel.h"
#import "PhotoViewController.h"
#import "MainNavigationController.h"
@interface ImageListController ()

@end

@implementation ImageListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"图片新闻";
    [self _requestData];
}

#pragma mark - loadData
-(void)_requestData{
    //加载数据
    NSArray *array = (NSArray *)[MovieDataService requestData:image_list];
    self.data = [NSMutableArray arrayWithCapacity:array.count];
    
    for (NSDictionary *dic in array) {
        NewsModel *newsModel = [[NewsModel alloc]init];
        newsModel.image = dic[@"image"];
        
        [_data addObject:newsModel];
    }
    
    [_collectionView reloadData];
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    UIImageView *imgView = (UIImageView *)[cell.contentView viewWithTag:200];
    NewsModel *news = self.data[indexPath.row];
    [imgView sd_setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"pig"]];
    
    return cell;
    
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //取出所有的model里面的图片url
    NSMutableArray *urls = [NSMutableArray array];
    for (NewsModel *moedel in self.data) {
        NSString *urlString = moedel.image;
        [urls addObject:urlString];
    }
    
    PhotoViewController *photoCtrl = [[PhotoViewController alloc]init];
    
    //图片url的传递
    photoCtrl.urls = urls;
    photoCtrl.indexPath = indexPath;
    
    //添加导航栏
    MainNavigationController *navigation = [[MainNavigationController alloc]initWithRootViewController:photoCtrl];
    
    [self presentViewController:navigation animated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
