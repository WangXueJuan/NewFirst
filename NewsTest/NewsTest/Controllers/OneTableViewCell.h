//
//  OneTableViewCell.h
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
#import "OneModel.h"
@interface OneTableViewCell : UITableViewCell
@property(nonatomic, retain) UIImageView *picture;
@property(nonatomic, retain) UILabel *titleLabel;
@property(nonatomic, retain) UILabel *subLabel;


@property(nonatomic, retain) OneModel *model;
@end
