//
//  SubCell.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *_img01;
    __weak IBOutlet UIImageView *_img02;
    __weak IBOutlet UIImageView *_img03;
    __weak IBOutlet UIImageView *_img04;
}
@property(nonatomic,copy)NSArray *data;
@end
