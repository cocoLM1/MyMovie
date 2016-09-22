//
//  MovieCell.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;
@class StarView;
@interface MovieCell : UITableViewCell{
    
    //各种子视图
    __weak IBOutlet UIImageView *imgView;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *ratingLabel;
    __weak IBOutlet UILabel *yearLabel;
    __weak IBOutlet StarView *starView;
}
@property(nonatomic,strong)Movie *movie;
@end
