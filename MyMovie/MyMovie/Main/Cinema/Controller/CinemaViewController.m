//
//  CinemaViewController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaModel.h"
#import "CinemaCell.h"
@interface CinemaViewController ()
{
    NSMutableArray *_data;
    NSMutableArray *_count;
    NSMutableArray *_arr;
    
    BOOL com[100];
}
@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self _loadData];
    [self _getSectionCount];
    [self _getRowCount];
}

#pragma mark - loadData
-(void)_loadData{
    NSDictionary *dic = (NSDictionary *)[MovieDataService requestData:@"cinema_list.json"];
    NSArray *arr = [dic objectForKey:@"cinemaList"];
    
    _data = [[NSMutableArray alloc]init];
    for (NSDictionary *jsonDic in arr) {
        CinemaModel *cinema = [[CinemaModel alloc]init];
        cinema.lowPrice = [jsonDic objectForKey:@"lowPrice"];
        cinema.grade = [jsonDic objectForKey:@"grade"];
        cinema.distance = [jsonDic objectForKey:@"distance"];
        cinema.address = [jsonDic objectForKey:@"address"];
        cinema.name = [jsonDic objectForKey: @"name"];
        cinema.districtId = [jsonDic objectForKey:@"districtId"];
        
        [_data addObject:cinema];
    }
    
    [_tableView reloadData];
    
}

-(void)_getSectionCount{
    _arr = [[NSMutableArray alloc]init];
    
    for (CinemaModel *cinema in _data) {
        BOOL isTure = YES;
        if (_arr.count == 0) {
            [_arr addObject:cinema.districtId];
        }
        for (NSString *idd in _arr) {
            if ([idd isEqualToString:cinema.districtId]) {
                isTure = NO;
            }
        }
        if (isTure && ![cinema.districtId  isEqual: @""]) {
            [_arr addObject:cinema.districtId];
        }
    }
    
}

-(void)_getRowCount{
    _count = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < _arr.count; i++) {
        NSMutableArray *cur = [[NSMutableArray alloc]init];
        
        for (CinemaModel *cinema in _data) {
            if ([cinema.districtId isEqualToString:_arr[i]]) {
                [cur addObject:cinema];
            }
        }
        [_count addObject:cur];
    }
    
}

#pragma mark - TableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _arr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (com[section]) {
        NSArray *cur = _count[section];
        NSInteger n = cur.count;
        return n;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaCell" forIndexPath:indexPath];
    NSArray *cur = _count[indexPath.section];
    cell.cinema = cur[indexPath.row];
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"%li",section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

#pragma mark - UITableViewDelegate
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.layer.borderWidth = 5;
    
    btn.tag = 100 + section;
    
    btn.backgroundColor = [UIColor colorWithWhite:.3 alpha:.3];
    
    NSArray *cur = @[@"海淀区",@"西城区",@"丰台区",@"崇文区",@"大兴区",@"朝阳区",@"昌平区",@"石景山区",@"东城区",@"通州区",@"顺义区",@"宣武区",@"怀柔城区",@"平谷区",@"燕郊开发区",@"门头沟区",@"房山区",@"延庆县",@"密云县"];
    
    
    [btn setTitle:[NSString stringWithFormat:@"%@",cur[section]] forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

//展开 或 折起 被点击组
-(void)buttonAction:(UIButton *)button{
    com[button.tag-100] = !com[button.tag-100];
    
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag-100] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
