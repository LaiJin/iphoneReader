//
//  RootViewController.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-23.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "RootViewController.h"
#import "OCMapper.h"
#import "Book.h"
#import "Tags.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     bookList = [[BookList alloc]init];
    [bookList getURLInBackground:self];
    [bookList unarchiveBookListArray];
    booklistTableView = [[BookListTableView alloc]init];
    [booklistTableView addBookListTableView:self];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)requestFinished:(ASIHTTPRequest *)request{

    NSData *responseData = [request responseData];
    NSError *error = [request error];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    NSArray *booksArray = [jsonDictionary objectForKey:@"books"];
    NSMutableArray *bookListArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < [booksArray count]; i++) {
        Book *indexBook = [Book objectFromDictionary: [booksArray objectAtIndex:i]];
        [bookListArray addObject:indexBook];
    }
    [bookList archiveBookListArray:bookListArray];
    
}

- (void)requestFailed :(ASIHTTPRequest *)request{
    
    NSError *error = [request error];
    NSLog(@"%@",error);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [bookList countOfBookListArray];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *booklistCellIdentifier = @"booklistCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:booklistCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:booklistCellIdentifier];
    }
    cell.textLabel.text = [bookList bookTitle:indexPath.row];
    cell.detailTextLabel.text = [bookList bookAuthor:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
