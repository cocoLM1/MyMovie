//
//  TopDetailCell.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopDetailCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_icon;
    __weak IBOutlet UILabel *_nameLabel;
    
    __weak IBOutlet UILabel *_timeLabel;
    __weak IBOutlet UILabel *_commentLabel;
}
@property(nonatomic,copy)NSDictionary *data;
@end
