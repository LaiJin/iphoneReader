//
//  BookListTableView.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "BookListTableView.h"

@implementation BookListTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)addBookListTableView:(RootViewController *)rootViewController{
    
    UITableView *bookListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 415) style:UITableViewStylePlain];
    bookListTableView.dataSource = rootViewController;
    bookListTableView.delegate = rootViewController;
    [rootViewController.view addSubview:bookListTableView];
    
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
