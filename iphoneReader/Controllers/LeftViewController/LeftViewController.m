//
//  LeftViewController.m
//  iphoneReader
//
//  Created by xyooyy on 13-11-6.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "LeftViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "RootViewController.h"


@interface LeftViewController ()

@end

@implementation LeftViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    catalog = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"电影类",@"movies",@"音乐类",@"musics",@"小说类",@"novels",@"杂志类",@"magazines",@"编程类",@"programs",@"计算机类",@"computers", nil];
    
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:49.0/255.0 green:54.0/255.0 blue:57.0/255.0
                                                      alpha:1.0]];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:77.0/255.0 green:79.0/255.0 blue:80.0/255.0
                                                       alpha:1.0]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return @"书的分类";
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [catalog count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [[catalog allValues] objectAtIndex:indexPath.row];
    return cell;
    
}


#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RootViewController *centerViewController = [[RootViewController alloc]init];
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:centerViewController];
    [self.mm_drawerController setCenterViewController:navController withCloseAnimation:YES completion:nil];
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


@end
