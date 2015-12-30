//
//  TwoTableViewCell.m
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import "TwoTableViewCell.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
@implementation TwoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self contextData];
    }
    return self;


}

- (void)contextData{
    //初始化imageView
    self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 6, kWidth / 4 , kWidth / 4)];
    [self.contentView addSubview:self.headImage];
    //初始化标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 4 + 10, 6, kWidth * 0.75, 35)];
    self.titleLabel.font = [UIFont systemFontOfSize:22.0];
    [self.contentView addSubview:self.titleLabel];
    //初始化副标题
    self.fuTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 4 + 10, kWidth / 8, kWidth * 0.75, 35)];
    self.fuTitleLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.fuTitleLabel];

}

//重写cellModel的set方法
-(void)setCellModel:(TwoModel *)cellModel{
    self.titleLabel.text = cellModel.title;
    self.fuTitleLabel.text = cellModel.timeDetail;
    NSURL *url = [NSURL URLWithString:cellModel.imageT];
    [self.headImage setImageWithURL:url placeholderImage:nil];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
