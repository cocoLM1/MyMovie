//
//  TopCell.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "TopCell.h"
#import "Movie.h"
#import "StarView.h"
@implementation TopCell

-(void)setMovie:(Movie *)movie{
    if (movie != nil) {
        _movie = movie;
        
        //1.加载图片
        NSString *urlString = [self.movie.images objectForKey:@"medium"];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:urlString]];
        
        //2.加载标题
        _titleLabel.text = self.movie.title;
        _titleLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:.3];
        
        //3.加载星星
        _starView.rating = [self.movie.average floatValue];
        
        //4.加载评分
        _ratingLabel.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
        
    }
}

@end
