//
//  CinemaCell.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "CinemaCell.h"
#import "CinemaModel.h"
@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setCinema:(CinemaModel *)cinema{
    if (_cinema != cinema) {
        _cinema = cinema;
        
        _nameLabel.text = cinema.name;
        _gradeLabel.text = cinema.grade;
        distanceLabel.text = @"40 km";
        _addressLabel.text = cinema.address;
        
        if ([cinema.lowPrice  isKindOfClass:[NSNull class]]) {
            _lowPriceLabel.text = @"无";
        }else{
            _lowPriceLabel.text = [NSString stringWithFormat:@"￥ %@",cinema.lowPrice];
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
