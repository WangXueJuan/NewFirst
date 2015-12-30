//
//  SelectViewController.m
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import "SelectViewController.h"
#import <UIImageView+WebCache.h>
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
@interface SelectViewController ()

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = _oneModel.titleSpelling;
    
    //资料图片
    UIImageView *picture = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, kWidth - 40, kWidth - 100)];
    NSURL *url = [NSURL URLWithString:_oneModel.image];
    [picture setImageWithURL:url placeholderImage:nil];
    [self.view addSubview:picture];
    
    //新闻详情
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 400, kWidth - 20, kHeight - 450)];
    textView.font = [UIFont systemFontOfSize:20];
    textView.text = _oneModel.content;
    [self.view addSubview:textView];

    //新闻时间
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, kWidth / 2, kWidth / 8)];
    timeLabel.text = _oneModel.subTitle;
    [self.view addSubview:timeLabel];
    
    //资源
    UILabel *readLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 60, kWidth / 4, kWidth / 8)];
    readLabel.text = _oneModel.readCount;
    [self.view addSubview:readLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
