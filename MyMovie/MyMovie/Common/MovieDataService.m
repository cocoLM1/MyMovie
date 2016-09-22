//
//  MovieDataService.m
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import "MovieDataService.h"

@implementation MovieDataService

+(instancetype)requestData:(NSString *)fileName{
    // 获取文件路径
    NSString *filePath = [[NSBundle mainBundle]pathForResource:fileName ofType:NULL];
    // 根据路径获取数据
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    // 解析 JSON 数据
    id jason = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    return jason;
}

@end
