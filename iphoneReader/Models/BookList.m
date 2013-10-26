//
//  BookList.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "BookList.h"
#import "ASIHTTPRequest.h"
#import "Tags.h"

@implementation BookList

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:bookListArray forKey:@"bookList"];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        
        bookListArray = [aDecoder decodeObjectForKey:@"bookList"];
    }
    return self;
}


//异步请求
- (void)getURLInBackground :(UIViewController *)rootViewController{
    
    NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/book/search?tag=computer"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:rootViewController];
    [request startAsynchronous];
    
    
}
- (NSString *)booklistFilePath{
    
    NSString *bookListFilePath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    bookListFilePath= [bookListFilePath stringByAppendingPathComponent:@"bookList.plist"];
    return bookListFilePath;
}

- (void)archiveBookListArray:(NSMutableArray *)bookListMutableArray{
    
    bookListArray = [NSArray arrayWithArray:bookListMutableArray];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self booklistFilePath]])
    [NSKeyedArchiver archiveRootObject:bookListArray toFile:[self booklistFilePath]];
}

- (NSInteger)countOfBookListArray{
    
    return [bookListArray count];
}

- (void)unarchiveBookListArray{
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self booklistFilePath]])
    bookListArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self booklistFilePath]];
}

    
- (NSString *)bookTitle :(NSInteger)indexPathRow{
    
    indexBook = [bookListArray objectAtIndex:indexPathRow];
    return indexBook.title;
}

- (NSString *)bookAuthor :(NSInteger)indexPathRow{
    
    if ([indexBook.author count] != 0)
        return [indexBook.author objectAtIndex:0];
    return nil;

}
@end
