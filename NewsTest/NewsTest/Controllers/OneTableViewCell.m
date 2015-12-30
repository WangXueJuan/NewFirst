//
//  OneTableViewCell.m
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import "OneTableViewCell.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
@implementation OneTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self titleCreate];
    }
    return self;
}


- (void)titleCreate{
    //创建图片
    self.picture = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, kWidth/4, kWidth/4 - 5)];
    [self.contentView addSubview:self.picture];

    //创建label
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 4 + 15, 5, kWidth * 3 / 4- 20, kWidth  /4/2)];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.numberOfLines = 0;
    [self addSubview:self.titleLabel];
    
    self.subLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 4+10, kWidth/ 8 + 5, kWidth * 3 / 4, kWidth/8- 5)];
    self.subLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:self.subLabel];
    
    
}

- (void)setModel:(OneModel *)model{
    self.titleLabel.text = model.title;
    self.subLabel.text = model.subTitle;
    
    
    NSURL *url = [NSURL URLWithString:model.image];
    [self.picture setImageWithURL:url placeholderImage:nil];
    
}




- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
