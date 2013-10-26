//
//  BookList.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"


@interface BookList : NSObject<NSCoding>{
    
    NSArray *bookListArray;
    Book *indexBook;
    
}
    
    
    


- (void)getURLInBackground :(UIViewController *)rootViewController;
- (void)archiveBookListArray :(NSMutableArray *)bookListMutableArray;
- (void)unarchiveBookListArray;
- (NSInteger)countOfBookListArray;
- (NSString *)bookTitle :(NSInteger)indexPathRow;
- (NSString *)bookAuthor :(NSInteger)indexPathRow;

@end
