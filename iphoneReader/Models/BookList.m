//
//  BookList.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "BookList.h"
#import "ASIHTTPRequest.h"
#import "OCMapper.h"
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
- (void)getURLInBackground {
    
    NSURL *url = [NSURL URLWithString:@"https://api.douban.com/v2/book/search?tag=ios"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    
    
}

- (void)requestFinished:(ASIHTTPRequest *)request{
    
    NSData *responseData = [request responseData];
    NSError *error = [request error];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    NSArray *booksArray = [jsonDictionary objectForKey:@"books"];
    bookListArray = [[NSMutableArray alloc]init];
    for (int i = 0; i < [booksArray count]; i++) {
        indexBook = [Book objectFromDictionary: [booksArray objectAtIndex:i]];
        [bookListArray addObject:indexBook];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"requestFinished" object:nil];
    NSLog(@"%@",bookListArray);
    //[self archiveBookListArray];
    
}

- (void)requestFailed :(ASIHTTPRequest *)request{
    
    NSError *error = [request error];
    NSLog(@"%@",error);
    
}

//- (void)archiveBookListArray{
//    
//    [NSKeyedArchiver archiveRootObject:bookListArray toFile:[self booklistPath]];
//   
//}
//
//- (void)unarchiveBookListArray{
//    
//    if ([[NSFileManager defaultManager] fileExistsAtPath: [self booklistPath]])
//        bookListArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self booklistPath]];
//}
//
//- (NSString *)booklistPath{
//    
//    NSString *bookListFilePath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    bookListFilePath= [bookListFilePath stringByAppendingPathComponent:@"bookList.plist"];
//    return bookListFilePath;
//}





- (NSInteger)countOfBookListArray{
    
    return [bookListArray count];
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
