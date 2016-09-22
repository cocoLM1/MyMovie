//
//  TopDetailViewController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "TopDetailViewController.h"
#import "TopHeaderCell.h"
#import "TopDetailCell.h"
#import "SubCell.h"

@interface TopDetailViewController ()
{
    __weak IBOutlet UITableView *_tableView;
    NSMutableArray *_commentData;
    BOOL isSecond;
}
@end

@implementation TopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isSecond = YES;
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self _loadData];
    
}
#pragma mark - loadData
-(void)_loadData{
    NSDictionary *comment = (NSDictionary *)[MovieDataService requestData:@"movie_comment.json"];
    _detailData = (NSDictionary *)[MovieDataService requestData:@"movie_detail.json"];
    
    NSArray *list = [comment objectForKey:@"list"];
    _commentData = [list mutableCopy];
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _commentData.count + 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        TopHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IdentiferTopHeaderCell" forIndexPath:indexPath];
        cell.data = self.detailData;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }else if(indexPath.row == 1){
        SubCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IdentiferTopImageCell" forIndexPath:indexPath];
        cell.data = [self.detailData objectForKey:@"images"];
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }
    TopDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IdentiferTopCell" forIndexPath:indexPath];
    cell.data = _commentData[indexPath.row-2];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 180;
    }else if(indexPath.row == 1){
        return 80;
    }else if(indexPath == _index && isSecond == NO){
        
        NSString *_content = [_commentData[indexPath.row-2] objectForKey:@"content"];
        CGRect rect = [_content boundingRectWithSize:CGSizeMake(240, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        
        return rect.size.height +60;
    }else{
        return 80;
    }
}

// 展开选中评论区
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return;
    }
    isSecond = !isSecond;
    _index = indexPath;
    NSArray *indexpath = @[indexPath];
    [_tableView reloadRowsAtIndexPaths:indexpath withRowAnimation:UITableViewRowAnimationFade];
    
}

@end
