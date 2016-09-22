//
//  IndexCell.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "IndexCell.h"

@implementation IndexCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建图片
        [self _createView];
    }
    return self;
}
-(void)_createView{
    
    //1.创建图片视图
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width * 0.95, self.bounds.size.height * 0.95)];
    _imgView.center = self.contentView.center;
    [self.contentView addSubview:_imgView];
    
    
}
-(void)setUrl:(NSString *)url{
    if (_url != url) {
        _url = url;
    }
    //填充数据
    [_imgView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"pig"]];
    
}

@end
