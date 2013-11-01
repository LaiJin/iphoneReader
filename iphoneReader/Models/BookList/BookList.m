//
//  BookList.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "BookList.h"


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
#pragma mark Private Methods
- (BOOL)unarchiveBookListArray
{
    
    if ([[NSFileManager defaultManager] fileExistsAtPath: [self booklistPath]])
        bookListArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self booklistPath]];
    else return bookListArray == nil;
    return YES;

}


- (void)setBookListArray:(NSMutableArray *)booksArray
{
    
    bookListArray = [[NSMutableArray alloc]initWithArray:booksArray];
    [NSKeyedArchiver archiveRootObject:bookListArray toFile:[self booklistPath]];
    
}


- (NSString *)booklistPath
{
    
    NSString *bookListFilePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    bookListFilePath= [bookListFilePath stringByAppendingPathComponent:@"bookList.plist"];
    return bookListFilePath;

}


#pragma mark -
#pragma mark Public Methods
- (NSInteger)countOfBookListArray
{
    [self unarchiveBookListArray];
    return [bookListArray count];
    
}


- (Book *)indexBookModel:(NSInteger)index
{
    
    return [bookListArray objectAtIndex:index];
    
}





@end
