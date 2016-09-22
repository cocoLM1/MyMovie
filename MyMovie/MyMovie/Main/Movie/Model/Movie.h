//
//  Movie.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
//评分
@property(nonatomic,strong)NSNumber *average;
//标题
@property(nonatomic,copy)NSString *title;
//原标题
@property(nonatomic,copy)NSString *original_title;
//种类
@property(nonatomic,copy)NSString *subtype;
//年份
@property(nonatomic,copy)NSString *year;
//images
@property(nonatomic,copy)NSDictionary *images;
//电影id
@property(nonatomic,copy)NSString *movieId;
//收藏人数
@property(nonatomic,strong)NSNumber *collect_count;

@end
