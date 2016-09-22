//
//  PhotoScrollView.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "PhotoScrollView.h"

@implementation PhotoScrollView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:_imgView];
        //1.设置缩放的最大、最小倍数
        self.maximumZoomScale = 4.0;
        self.minimumZoomScale = 1.0;
        
        //2.隐藏滚动条
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        //3.设置代理
        self.delegate = self;
        
        //4.创建单击手势对象
        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
        
        //设置点击次数
        tap2.numberOfTapsRequired = 2;
        
        
        //添加手势
        [self addGestureRecognizer:tap2];
        
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1:)];
        
        //设置点击次数
        tap1.numberOfTapsRequired = 1;
        
        [self addGestureRecognizer:tap1];
        //设置图片填充方式
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        
        //当tap2手势触发时，让tap1失效
        [tap1 requireGestureRecognizerToFail:tap2];
    }
    return self;
    
}
-(void)tap1:(UITapGestureRecognizer *)tap1{
    NSLog(@"成功单击一次");
    
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"玉材" object:self];
    
    
}



-(void)tap2:(UITapGestureRecognizer *)tap2{
    NSLog(@"成功双击一次");
    
    if (self.zoomScale > 1.0) {
        [self setZoomScale:1.0 animated:YES];
    }else{
        [self setZoomScale:3.0 animated:YES];
    }
    
}
-(void)setUrl:(NSURL *)url{
    if (_url != url) {
        _url = url;
        
        //加载网络图片
        [_imgView sd_setImageWithURL:url];
    }
}
#pragma mark - UIScrollViewDelegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imgView;
}


@end
