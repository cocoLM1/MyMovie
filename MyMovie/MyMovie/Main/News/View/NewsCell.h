//
//  NewsCell.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;
@interface NewsCell : UITableViewCell
{
    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_titleLabel;
    
    __weak IBOutlet UILabel *_summaryLabel;
    __weak IBOutlet UIImageView *_iconImg;
}
@property(nonatomic,strong)NewsModel *news;@end
