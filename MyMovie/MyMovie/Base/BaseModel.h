//
//  BaseModel.h
//  MyMovie
//
//  Created by mymac on 16/9/22.
//  Copyright © 2016年 XiaoLM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

-(id)initContentWithDic:(NSDictionary *)jsonDic;
-(void)setAttributes:(NSDictionary *)jsonDic;
-(NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic;
@end
