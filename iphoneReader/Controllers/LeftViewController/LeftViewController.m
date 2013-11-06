//
//  LeftViewController.m
//  iphoneReader
//
//  Created by xyooyy on 13-11-6.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "LeftViewController.h"
#import "BookListTableViewCell.h"
#import "Book.h"


@interface LeftViewController ()

@end

@implementation LeftViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(obtainleftDisplayBooks:) name:@"leftDisplayBooks" object:nil];
    }
    return self;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Private Methods
- (void)obtainleftDisplayBooks:(NSNotification *)notification
{
    leftDispalyBooks = [NSMutableArray arrayWithArray:[notification object]];
    [self.tableView reloadData];
    
}


#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [leftDispalyBooks count];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CellIndentifier";
    BookListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[BookListTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Book *leftBookModel = [leftDispalyBooks objectAtIndex:indexPath.section];
    [cell getBookAuthorLabelText:leftBookModel.author];
    [cell getBookTitleLabelText:leftBookModel.title];
    [cell getImageViewUrl:leftBookModel.images.small];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
    
}


#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 120;
    
}


#pragma mark -
#pragma mark Dealloc Methods
- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"leftDisplayBooks" object:nil];
    
}

@end
