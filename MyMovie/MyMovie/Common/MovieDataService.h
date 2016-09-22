//
//  MovieDataService.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieDataService : NSObject
+(instancetype)requestData:(NSString *)fileName;
@end
