//
//  MovieCell.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "MovieCell.h"
#import "Movie.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
@implementation MovieCell

//有xib文件的情况下，加载时会调用，这个时候movie还未穿入，数据无法填充
- (void)awakeFromNib {
    //去掉背景颜色
    self.backgroundColor = [UIColor clearColor];
    //去掉选中风格
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

-(void)setMovie:(Movie *)movie{
    _movie = movie;
    //单元格的数据传递
    titleLabel.text = self.movie.title;
    
    yearLabel.text = [NSString stringWithFormat:@"年份:%@",self.movie.year];
    
    ratingLabel.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    //图片加载
    NSString *small = [self.movie.images objectForKey:@"small"];
    
    //1.将取出的字符串转化成url
    NSURL *url = [NSURL URLWithString:small];
    
    [imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"pig"]];
    
    
    starView.rating = [self.movie.average floatValue];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


@end
