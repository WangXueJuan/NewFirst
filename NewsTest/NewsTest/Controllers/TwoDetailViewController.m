//
//  TwoDetailViewController.m
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import "TwoDetailViewController.h"
#import <UIImageView+WebCache.h>
#define kWidth [UIScreen mainScreen].bounds.size.width
@interface TwoDetailViewController ()
@property(nonatomic, retain) NSMutableArray *urlDetailArray;

@end

@implementation TwoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建标题label
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 70,kWidth - 30, 40)];
    titleLabel.text = self.twoModel.title;
   
    titleLabel.numberOfLines = 0;
    [self.view addSubview:titleLabel];
    //创建imageView
    UIImageView *imageTit = [[UIImageView alloc] initWithFrame:CGRectMake(20, 120,kWidth - 40, kWidth / 2.5 + 60)];
    NSURL *url = [NSURL URLWithString:self.twoModel.imageT];
    [imageTit setImageWithURL:url placeholderImage:nil];
    [self.view addSubview:imageTit];
    //创建阅读量label
    UILabel *readLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, kWidth / 2.5 + 180,kWidth  / 3, 40)];
    readLabel.text = self.twoModel.readCountD;
    [self.view addSubview:readLabel];
    //创建时间label
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kWidth / 2 + 5, kWidth / 2.5 + 180,kWidth  / 2, 40)];
    timeLabel.text = self.twoModel.timeDetail;
    titleLabel.textColor = [UIColor grayColor];
    [self.view addSubview:timeLabel];
    //创建详情label
    UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, kWidth  / 2.5 + 135,kWidth - 20, 400)];
    detailLabel.text = self.twoModel.contextDetail;
    detailLabel.numberOfLines = 0;
    [self.view addSubview:detailLabel];
    //创建一个按钮，点击详情可以进入网页
    UIButton *clickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clickBtn.frame = CGRectMake(10, kWidth / 2.5 + 135, kWidth - 20, 400);
    [clickBtn addTarget:self action:@selector(gotoNet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];
    
    //初始化一个数组，用来存储接收到的url;
    self.urlDetailArray = [NSMutableArray new];
    [self.urlDetailArray addObject:self.twoModel.urlString];
    
    
}

//点击进入网页
- (void)gotoNet:(UIButton *)btn{
    for (NSString *string in self.urlDetailArray) {
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:string]];
    }
    


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
