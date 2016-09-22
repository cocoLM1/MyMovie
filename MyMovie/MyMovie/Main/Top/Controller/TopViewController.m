//
//  TopViewController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "TopViewController.h"
#import "Movie.h"
#import "TopCell.h"
#import "TopDetailViewController.h"

@interface TopViewController ()

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self _requestData];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
}
#pragma mark - loadData
-(void)_requestData{
    //解析json数据
    NSDictionary *jsonDic = (NSDictionary *)[MovieDataService requestData:top_250];
    _data = [NSMutableArray array];
    
    NSArray *array = [jsonDic objectForKey:@"subjects"];
    
    for (NSDictionary *dic in array) {
        Movie *movie = [[Movie alloc]init];
        
        movie.average = [[dic objectForKey:@"rating"]objectForKey:@"average"];
        movie.collect_count = [dic objectForKey:@"collect_count"];
        movie.images = [dic objectForKey:@"images"];
        movie.movieId = [dic objectForKey:@"id"];
        movie.title = [dic objectForKey:@"title"];
        movie.subtype = [dic objectForKey:@"subtype"];
        movie.year = [dic objectForKey:@"year"];
        movie.original_title = [dic objectForKey:@"original_title"];
        
        [_data addObject:movie];
        
    }
    //刷新数据
    [_collectionView reloadData];
}
#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TopCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"TopCell" forIndexPath:indexPath];
    cell.movie = self.data[indexPath.row];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    TopDetailViewController *topDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"TopDetailViewController"];
    //Push
    [topDetail setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:topDetail animated:YES];
}

@end
