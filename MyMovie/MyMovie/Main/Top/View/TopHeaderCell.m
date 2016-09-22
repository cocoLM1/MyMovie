//
//  TopHeaderCell.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "TopHeaderCell.h"

@implementation TopHeaderCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

-(void)setData:(NSDictionary *)data{
    if (_data != data) {
        _data = data;
        
        NSString *url = [_data objectForKey:@"image"];
        [_imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"pig"]];
        
        _titleLabel.text = [_data objectForKey:@"titleCn"];
        _subheadLabel.text = [_data objectForKey:@"titleEn"];
        _contentLabel.text = [_data objectForKey:@"content"];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
