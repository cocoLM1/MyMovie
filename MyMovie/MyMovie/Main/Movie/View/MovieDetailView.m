//
//  MovieDetailView.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "MovieDetailView.h"
#import "Movie.h"
#import "StarView.h"
@implementation MovieDetailView


-(void)setMovie:(Movie *)movie{
    if (_movie != movie) {
        _movie = movie;
        
        //1.电影图片
        NSString *mediumUrl = [self.movie.images objectForKey:@"medium"];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:mediumUrl] placeholderImage:[UIImage imageNamed:@"pig"]];
        
        //2.电影的标题
        _titleLabel.text = [NSString stringWithFormat:@"中文标题:%@",_movie.title];
        
        //3.原标题
        _sourceTitleLabel.text = [NSString stringWithFormat:@"源标题:%@",_movie.original_title];
        
        //4.年份
        _yearLabel.text = [NSString stringWithFormat:@"年份:%@",_movie.year];
        
        //5.评分
        _starView.rating = [self.movie.average floatValue];
        
        _ratingLabel.text = [NSString stringWithFormat:@"%.1f",self.movie.average.floatValue];
        
    }
}


@end
