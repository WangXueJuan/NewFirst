//
//  OneModel.h
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneModel : NSObject
@property(nonatomic, copy) NSString *image;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *subTitle;
@property(nonatomic, copy) NSString *content;
@property(nonatomic, copy) NSString *readCount;
@property(nonatomic, copy) NSString *titleSpelling;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
