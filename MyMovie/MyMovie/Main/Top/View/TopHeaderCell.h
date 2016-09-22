//
//  TopHeaderCell.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopHeaderCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_imgView;
    
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_subheadLabel;
    __weak IBOutlet UITextView *_contentLabel;
}
@property(nonatomic,assign)NSDictionary *data;
@end
