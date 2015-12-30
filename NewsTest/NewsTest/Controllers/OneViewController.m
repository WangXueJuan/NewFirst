//
//  OneViewController.m
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import "OneViewController.h"
#import "OneTableViewCell.h"
#import "SelectViewController.h"
@interface OneViewController ()
@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) NSMutableArray *dictArray;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor magentaColor];
    self.title = @"军事新闻";
    //添加到视图
    [self.view addSubview:self.tableView];
    
    //解析plist
    [self configPlist];
}

//懒加载
- (UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        //设置分割线
        self.tableView.separatorColor = [UIColor greenColor];
        //设置行高
        self.tableView.rowHeight = 100;
        //设置代理
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
       
        
    }
    return _tableView;
}

//解析方法
- (void)configPlist{
    //加载一个NSuRL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.milltary.app887.com/api/Articles.action?opc=10&npc=0&type=%E6%9C%80%E6%96%B0%E9%B2%9C"]];
    //将请求的url数据放到NSData中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
    
    //获取字典中的数据
    NSDictionary *dicArray = [dic valueForKey:@"root"];
    NSDictionary *listDic = [dicArray valueForKey:@"list"];
    
    self.dictArray = [NSMutableArray new];
    NSMutableArray *group = [NSMutableArray new];
    
    for (NSDictionary *dic in listDic) {
        OneModel *model = [[OneModel alloc] initWithDictionary:dic];
        [group addObject:model];
        
    }
    [self.dictArray addObject:group];
    
}


#pragma mark ------------------  UITableViewDataSource
//cell 重用机制
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIntedifier = @"cellIntedifier";
    OneTableViewCell  *OneCell = [tableView dequeueReusableCellWithIdentifier:cellIntedifier];
    if (OneCell == nil) {
        OneCell = [[OneTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIntedifier];
        
    }
    
    //点击单元格颜色不变
    OneCell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableArray *group = self.dictArray[indexPath.section];
    OneModel *model = group[indexPath.row];
    OneCell.model = model;

   
    return OneCell;
}

//返回分区多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *group = self.dictArray[section];
    return group.count;
}

//返回由多少分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


//单元格点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectViewController *selectVC = [[SelectViewController alloc] init];
    
    NSMutableArray *group = self.dictArray[indexPath.section];
    selectVC.oneModel = group[indexPath.row];
    
    [self.navigationController pushViewController:selectVC animated:YES];
    
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
