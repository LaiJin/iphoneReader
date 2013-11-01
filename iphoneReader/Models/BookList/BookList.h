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
    
    @private
    NSMutableArray *bookListArray;
    
}



- (BOOL)unarchiveBookListArray;
- (void)setBookListArray:(NSMutableArray *)booksArray;
- (Book *)indexBookModel:(NSInteger)index;
- (NSInteger)countOfBookListArray;


@end
