//
//  PhotoCell.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "PhotoCell.h"
#import "PhotoScrollView.h"
@implementation PhotoCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _scrolView = [[PhotoScrollView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:_scrolView];
    }
    return self;
}
-(void)setUrl:(NSString *)url{
    if (_url != url) {
        _url = url;
        
        _scrolView.url = [NSURL URLWithString:url];
        
    }
}
@end
