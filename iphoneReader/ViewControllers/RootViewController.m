//
//  RootViewController.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-23.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "RootViewController.h"
#import "OCMapper.h"
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
    [self getURLInBackground];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//异步请求
-(void)getURLInBackground{
    
    NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/book/search?tag=computer"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    
    
}

- (void)requestFinished:(ASIHTTPRequest *)request{

    NSData *responseData = [request responseData];
    NSError *error = [request error];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    NSArray *booksArray = [jsonDictionary objectForKey:@"books"];
    NSLog(@"%@",[booksArray objectAtIndex:0]);
}

-(void)requestFailed :(ASIHTTPRequest *)request{
    
    NSError *error = [request error];
    NSLog(@"%@",error);
    
}

@end
