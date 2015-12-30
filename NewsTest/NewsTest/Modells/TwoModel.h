//
//  TwoModel.h
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoModel : NSObject
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *timeDetail;
@property(nonatomic, retain) NSString *imageT;
@property(nonatomic, retain) NSString *detail;
@property(nonatomic, retain) NSString *contextDetail;
@property(nonatomic, retain) NSString *readCountD;
@property(nonatomic, retain) NSString *urlString;


//定义一个公开的方法，把外部传来的字典进行加工转化成model
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
