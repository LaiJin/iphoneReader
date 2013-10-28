//
//  BookList.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "ASIHTTPRequest.h"

@interface BookList : NSObject<NSCoding,ASIHTTPRequestDelegate>{
    
    @private
    NSMutableArray *bookListArray;
    
}    




- (void)getURLInBackground :(NSString *)bookType;
- (BOOL)unarchiveBookListArray;
- (Book *)indexBookModel :(NSInteger)index;
- (NSInteger)countOfBookListArray;


@end
