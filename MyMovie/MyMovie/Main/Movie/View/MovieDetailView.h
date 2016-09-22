//
//  MovieDetailView.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class Movie;
@interface MovieDetailView : UIView
{
    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_titleLabel;
    
    __weak IBOutlet UILabel *_sourceTitleLabel;
    __weak IBOutlet UILabel *_yearLabel;
    __weak IBOutlet StarView *_starView;
    __weak IBOutlet UILabel *_ratingLabel;
}

@property(nonatomic,strong)Movie *movie;

@end
