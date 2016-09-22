//
//  CinemaCell.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CinemaModel;
@interface CinemaCell : UITableViewCell
{
    __weak IBOutlet UILabel *_nameLabel;
    
    __weak IBOutlet UILabel *_gradeLabel;
    __weak IBOutlet UILabel *_addressLabel;
    __weak IBOutlet UILabel *_lowPriceLabel;
    __weak IBOutlet UILabel *distanceLabel;
}
@property(nonatomic,strong)CinemaModel *cinema;
@end
