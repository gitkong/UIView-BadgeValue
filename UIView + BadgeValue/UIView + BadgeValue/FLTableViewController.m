//
//  FLTableViewController.m
//  FLTestDemo
//
//  Created by clarence on 16/11/29.
//  Copyright © 2016年 gitKong. All rights reserved.
//

#import "FLTableViewController.h"
#import "FLTableViewCell.h"
#import "UIView+BadgeValue.h"
@interface FLTableViewController ()

@end

@implementation FLTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FLTableViewCell" bundle:nil] forCellReuseIdentifier:@"reuseIdentifier"];
    self.tableView.estimatedRowHeight = 44;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    
    // Configure the cell...
    // 强制布局
    [cell layoutIfNeeded];
    
    cell.label.fl_badgeValue = @"10";
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FLTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"before %@",cell.label.fl_badgeValue);
    cell.label.fl_badgeValue = @"";
    NSLog(@"after %@",cell.label.fl_badgeValue);
}



@end
