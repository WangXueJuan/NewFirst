//
//  ViewController.m
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import "ViewController.h"
#import "TwoTableViewCell.h"
#import "TwoDetailViewController.h"
@interface ViewController ()
@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) NSMutableArray *listArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"军事之谜";
    //将tableView添加到视图上
    [self.view addSubview:self.tableView];
    
    //解析数据
    [self configData];
    
    
}

//懒加载创建tableView
-(UITableView *)tableView{
    if (_tableView == nil) {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorColor = [UIColor clearColor];
        self.tableView.rowHeight = 100.0;
        //设置代理
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    

    
    return _tableView;


}

#pragma mark ------- 实现协议方法
//返回多少个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}


//返回多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *grouoArray = self.listArray[section];
    return grouoArray.count;
}
//重用机制
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"ID";
    TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[TwoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //取出对应分区的数据
    NSMutableArray *group = self.listArray[indexPath.section];
    TwoModel *model = group[indexPath.row];
    cell.cellModel = model;

    
    return cell;

}

// 解析数据
- (void)configData{
    
    //加载一个NSuRL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.milltary.app887.com/api/Articles.action?opc=10&npc=0&type=%E6%9C%80%E6%96%B0%E9%B2%9C"]];
    //将请求的url数据放到NSData中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
    //获取数组root的内容
    NSDictionary *dic1 = [dic objectForKey:@"root"];
    //    NSLog(@"list数组内容为%@",dic1);
    NSArray *count = [dic1 objectForKey:@"count"];
    NSLog(@"count = %@",count);
    NSArray *list = [dic1 objectForKey:@"list"];
    //初始化成员变量
    _listArray = [NSMutableArray new];
    NSMutableArray *array = [NSMutableArray new];
    //遍历数组list里面的内容
    for (int i = 0; i < list.count; i++) {
        //按数组中的索引取出对应的字典
        NSDictionary *listDic = [list objectAtIndex:i];
        //通过字典中的key取出对应的value，
        TwoModel *model = [[TwoModel alloc] initWithDictionary:listDic];
        [array addObject:model];
    }
    [self.listArray addObject:array];

}

//实现点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TwoDetailViewController *twoDetailVC = [[TwoDetailViewController alloc] init];
    //把数据传送到model中
    NSMutableArray *group = self.listArray[indexPath.section];
    twoDetailVC.twoModel = group[indexPath.row];
    [self.navigationController pushViewController:twoDetailVC animated:YES];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
