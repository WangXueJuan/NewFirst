//
//  TwoModel.m
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import "TwoModel.h"

@implementation TwoModel

//初始化这个方法
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        //把字典中对应的键值取出放入model
        self.imageT = dict[@"imglink"];
        self.title = dict[@"title"];
        self.timeDetail = dict[@"date"];
        self.contextDetail = dict[@"content168"];
        self.readCountD = dict[@"TYPE"];
        self.urlString = dict[@"url"];

        
    }
    return self;
}




@end
