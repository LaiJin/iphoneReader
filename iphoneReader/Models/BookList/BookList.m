//
//  BookList.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "BookList.h"


@implementation BookList


- (id)init
{
    
    self = [super init];
    if (self) {
        self.communtcation = [[CommunicationSource alloc]init];
    }
    return self;
    
}


#pragma mark -
#pragma mark NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:bookListArray forKey:@"bookList"];
    
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super init];
    if (self){
        bookListArray = [aDecoder decodeObjectForKey:@"bookList"];
    }
    return self;
    
}


#pragma mark -
#pragma mark Private Methods
- (NSString *)booklistPath
{
    
    NSString *bookListFilePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    bookListFilePath= [bookListFilePath stringByAppendingPathComponent:@"bookList.plist"];
    return bookListFilePath;

}


#pragma mark -
#pragma mark CommunicationDelegate
- (void)parseComplete:(NSMutableArray *)books
{
    
    bookListArray = [NSMutableArray arrayWithArray:books];
    
}


#pragma mark -
#pragma mark Public Methods
- (void)request:(NSString *)bookSpecies
{
    
    NSString *bookUrl = [NSString stringWithFormat:@"https://api.douban.com/v2/book/search?tag=%@",bookSpecies];
    [self.communtcation requestURL:bookUrl];
    
}


- (BOOL)unarchiveBookListArray
{
    
    if ([[NSFileManager defaultManager] fileExistsAtPath: [self booklistPath]])
        bookListArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self booklistPath]];
    else
        return bookListArray == nil;
    return YES;
    
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
