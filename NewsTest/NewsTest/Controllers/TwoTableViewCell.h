//
//  TwoTableViewCell.h
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwoModel.h"
#import <UIImageView+WebCache.h>
@interface TwoTableViewCell : UITableViewCell
@property(nonatomic, retain) UIImageView *headImage;
@property(nonatomic, retain) UILabel *titleLabel;
@property(nonatomic, retain) UILabel *fuTitleLabel;
@property(nonatomic, retain) TwoModel *cellModel;

@end
