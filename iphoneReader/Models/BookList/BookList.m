//
//  BookList.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "BookList.h"
#import "OCMapper.h"
#import "Tags.h"


@implementation BookList


#pragma mark -
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:bookListArray forKey:@"bookList"];
    
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super init];
    if (self)
        bookListArray = [aDecoder decodeObjectForKey:@"bookList"];
    return self;
    
}


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
    NSError *error = [request error];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    NSArray *booksArray = [jsonDictionary objectForKey:@"books"];
    bookListArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < [booksArray count]; i++) {
        Book *indexBook = [Book objectFromDictionary: [booksArray objectAtIndex:i]];
        [bookListArray addObject:indexBook];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"requestFinished" object:nil];
    [self archiveBookListArray];

}


- (void)requestFailed :(ASIHTTPRequest *)request
{
    
    NSError *error = [request error];
    NSLog(@"%@",error);

}


#pragma mark -
#pragma mark Private Methods
- (void)archiveBookListArray
{
    
    [NSKeyedArchiver archiveRootObject:bookListArray toFile:[self booklistPath]];
   
}


- (BOOL)unarchiveBookListArray
{
    
    if ([[NSFileManager defaultManager] fileExistsAtPath: [self booklistPath]])
        bookListArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self booklistPath]];
    if (bookListArray == nil) return NO;
    return YES;

}


#pragma mark -
#pragma mark Public Methods
- (NSString *)booklistPath
{
    
    NSString *bookListFilePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    bookListFilePath= [bookListFilePath stringByAppendingPathComponent:@"bookList.plist"];
    return bookListFilePath;

}


- (NSInteger)countOfBookListArray
{
    
    return [bookListArray count];
    
}


- (Book *)indexBookModel:(NSInteger)index
{
    
    return [bookListArray objectAtIndex:index];
    
}





@end
