//
//  CommunicationSource.m
//  iphoneReader
//
//  Created by xyooyy on 13-11-1.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "CommunicationSource.h"
#import "Book.h"
#import "BookList.h"
#import "OCMapper.h"

@implementation CommunicationSource




#pragma mark -
#pragma mark Public Method
- (void)requestURL:(NSString *)bookType
{
    
    NSString *bookUrl = [NSString stringWithFormat:@"https://api.douban.com/v2/book/search?tag=%@",bookType];
    NSURL *url = [NSURL URLWithString:bookUrl];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    
}//异步请求


#pragma mark -
#pragma mark ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    NSData *responseData = [request responseData];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
    NSArray *booksArray = [jsonDictionary objectForKey:@"books"];
    NSMutableArray *bookListArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < [booksArray count]; i++) {
        Book *indexBook = [Book objectFromDictionary: [booksArray objectAtIndex:i]];
        [bookListArray addObject:indexBook];
    }
    BookList *booList = [[BookList alloc]init];
    [booList setBookListArray:bookListArray];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"requestFinished" object:nil];
    
    
}


- (void)requestFailed :(ASIHTTPRequest *)request
{
    
    NSError *error = [request error];
    NSLog(@"%@",error);
    
}





@end
