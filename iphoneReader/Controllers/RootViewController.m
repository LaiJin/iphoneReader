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
    [bookList getBookListArray:bookListArray];
    
}
-(void)requestFailed :(ASIHTTPRequest *)request{
    
    NSError *error = [request error];
    NSLog(@"%@",error);
    
}

@end
