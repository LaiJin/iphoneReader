//
//  RootViewController.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-23.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "RootViewController.h"
#import "BookListTableViewCell.h"



@interface RootViewController ()
{
    NSInteger displayBooksCount;
    NSInteger count;
}

@end


@implementation RootViewController

#define firstDisplayBooks 6
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;

}


- (id)init
{
    self = [super init];
    if (self) {
        bookList = [[BookList alloc]init];
        displayBooksCount = firstDisplayBooks;
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if(!bookListTableView.pullTableIsRefreshing) {
        bookListTableView.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTableView) withObject:nil afterDelay:2.0f];
    }
    
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(determineWhetherAddTableView) name:@"requestFinished" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(requestFailureWarning:) name:@"requestFailed" object:nil];

}


- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}


#pragma mark -
#pragma mark Private Methods
- (void)determineWhetherAddTableView
{
    
    if (![bookList countOfBookListArray])
        [self addTableView];
    [bookList unarchiveBookListArray];
    count = [bookList countOfBookListArray] - [bookList countOfBookListArray] % firstDisplayBooks;
    bookListTableView.pullLastRefreshDate = [NSDate date];
    bookListTableView.pullTableIsRefreshing = NO;
    
}


- (void)addTableView
{
    
    bookListTableView = [[PullTableView alloc]initWithFrame:CGRectMake(0, 0, 320, 415) style:UITableViewStylePlain pullDownRefresh:YES pullUpLoadMore:YES];
    bookListTableView.pullDelegate = self;
    bookListTableView.dataSource = self;
    bookListTableView.delegate = self;
    [self.view addSubview:bookListTableView];
    
}


- (void)refreshTableView
{

    [bookList request:@"php"];
    
}


- (void)loadMoreDataToTableView
{
    
    if ([bookList countOfBookListArray] <= displayBooksCount)
        displayBooksCount = [bookList countOfBookListArray];
    else if (count == displayBooksCount)
        displayBooksCount = [bookList countOfBookListArray];
    else
        displayBooksCount += firstDisplayBooks;
    [bookListTableView reloadData];
    bookListTableView.pullTableIsLoadingMore = NO;
    
}


- (void)requestFailureWarning:(NSNotification *)notification
{
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请您检查网络是否正常" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertView show];
    [self addTableView];
    
}


#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (![bookList countOfBookListArray])
        return 0;
    return displayBooksCount;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *booklistCellIdentifier = @"booklistCellIdentifier";
    BookListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:booklistCellIdentifier];
    if (cell == nil) {
        cell = [[BookListTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:booklistCellIdentifier];
    }

    Book *indexBook = [bookList indexBookModel:indexPath.row];
    [cell getBookTitleLabelText:indexBook.title];
    [cell getBookAuthorLabelText:indexBook.author];
    [cell getImageViewUrl:indexBook.image];
    return cell;
    
}


#pragma mark -
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 120;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


#pragma mark -
#pragma mark PullTableViewDelegate
- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView
{
    
    [self refreshTableView];
    
}


- (void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView
{
    
    [self performSelector:@selector(loadMoreDataToTableView) withObject:nil afterDelay:3.0f];

}


#pragma mark -
#pragma mark Dealloc Methods
- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"requestFinished" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"requestFailed" object:nil];
    
}


@end
