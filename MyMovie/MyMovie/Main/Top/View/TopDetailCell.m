//
//  TopDetailCell.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "TopDetailCell.h"

@implementation TopDetailCell

-(void)setData:(NSDictionary *)data{
    if (_data != data) {
        _data = data;
        
        NSString *url = [_data objectForKey:@"userImage"];
        [_icon sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"pig"]];
        _nameLabel.text = [_data objectForKey:@"nickname"];
        _timeLabel.text = [_data objectForKey:@"rating"];
        _commentLabel.text = [_data objectForKey:@"content"];
        
    }
}
- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
