//
//  NewsDetailViewController.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "NewsDetailViewController.h"

@interface NewsDetailViewController ()<UIWebViewDelegate>

@end

@implementation NewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight-64)];
    
    [self.view addSubview:_webView];
    [self _loadData];
    
}
-(void)_loadData{
    //读取json数据
    NSDictionary *jsonDic = (NSDictionary *)[MovieDataService requestData:@"news_detail.json"];
    
    NSString *content = [jsonDic objectForKey:@"content"];//新闻内容
    NSString *source = [jsonDic objectForKey:@"source"];//新闻来源
    NSString *time = [jsonDic objectForKey:@"time"];//新闻时间
    NSString *author = [jsonDic objectForKey:@"author"];//新闻作者
    NSString *title = [jsonDic objectForKey:@"title"];//新闻标题
    
    //读取news.html
    NSString *fliePath = [[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *html = [NSString stringWithContentsOfFile:fliePath encoding:NSUTF8StringEncoding error:nil];
    
    //子标题 来源 时间
    NSString *subTitle = [NSString stringWithFormat:@"%@ %@",source,time];
    
    //编辑(作者)
    NSString *at = [NSString stringWithFormat:@"来自伟大的:%@",author];
    
    //拼接html文件
    NSString *htmlString = [NSString stringWithFormat:html,title,subTitle,content,at];
    
    
    [_webView loadHTMLString:htmlString baseURL:nil];
    
    //自适应
    _webView.delegate = self;
    
    //创建小菊花
    _activityView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:_activityView];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

//开始加载
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityView startAnimating];
}
//完成加载
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityView stopAnimating];
}


@end
