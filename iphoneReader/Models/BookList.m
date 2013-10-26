//
//  BookList.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "BookList.h"
#import "ASIHTTPRequest.h"

@implementation BookList




//异步请求
-(void)getURLInBackground :(UIViewController *)rootViewController{
    
    NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/book/search?tag=computer"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:rootViewController];
    [request startAsynchronous];
    
    
}

-(void)getBookListArray:(NSMutableArray *)bookListMutableArray{
    
    bookListArray = [NSArray arrayWithArray:bookListMutableArray];
    NSString *bookListFilePath =  [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    bookListFilePath= [bookListFilePath stringByAppendingPathComponent:@"bookList.plist"];
    NSLog(@"%@",bookListArray);
    
}


@end
