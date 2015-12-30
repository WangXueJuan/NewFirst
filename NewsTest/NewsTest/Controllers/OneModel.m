//
//  OneModel.m
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import "OneModel.h"

@implementation OneModel


- (instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.image = dic[@"imglink"];
        self.subTitle = dic[@"date"];
        self.title = dic[@"title"];
        self.content = dic[@"content168"];
        self.readCount = dic[@"sourcename"];
        self.titleSpelling = dic[@"titlespelling"];
    }
    
    
    return self;
    
    
}








@end
