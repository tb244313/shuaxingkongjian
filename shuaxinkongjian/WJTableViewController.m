//
//  WJTableViewController.m
//  shuaxinkongjian
//
//  Created by apple on 16/11/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "WJTableViewController.h"
#import "WJPullDownToRefreshView.h"

//self.tableView.contentIndset.top 可以让内容往下某个值开始

@interface WJTableViewController ()

//要显示的数据
@property (nonatomic, strong) NSArray *cities;

@end

@implementation WJTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    self.cities =  [self loadData];

    //创建frame
    CGRect refreshViewFrame = CGRectMake(0, -60, [UIScreen mainScreen].bounds.size.width, 60);
    
    //创建下拉刷新控件
    WJPullDownToRefreshView *refreshView = [[WJPullDownToRefreshView alloc] initWithFrame:refreshViewFrame];
    refreshView.backgroundColor = [UIColor brownColor];
    //添加到tableview里面
    [self.tableView addSubview:refreshView];
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    NSLog(@"self.tableView.contentInsert.top = %f",self.tableView.contentInset.top);

}
/**
 加载数据

 */
-(NSArray *)loadData{

    //文件的路径
    NSString *citiesFile = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:citiesFile];
    
    return array;

}

#pragma mark - Table view data source

//返回cell数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cities.count;

}
//返回一个cell给talbleView去显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    //设置cell的内容
    cell.textLabel.text = self.cities[indexPath.row];
    
    return cell;
    

}





@end
