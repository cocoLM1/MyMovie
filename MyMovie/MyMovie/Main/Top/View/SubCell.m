//
//  SubCell.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "SubCell.h"

@implementation SubCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setData:(NSArray *)data{
    if (_data != data) {
        _data = data;
        
        [_img01 sd_setImageWithURL:[NSURL URLWithString:_data[0]] placeholderImage:[UIImage imageNamed:@"pig"]];
        
        [_img02 sd_setImageWithURL:[NSURL URLWithString:_data[1]] placeholderImage:[UIImage imageNamed:@"pig"]];
        [_img03 sd_setImageWithURL:[NSURL URLWithString:_data[2]] placeholderImage:[UIImage imageNamed:@"pig"]];
        [_img04 sd_setImageWithURL:[NSURL URLWithString:_data[3]] placeholderImage:[UIImage imageNamed:@"pig"]];
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
