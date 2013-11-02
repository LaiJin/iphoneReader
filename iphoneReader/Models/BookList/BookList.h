//
//  BookList.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "CommunicationSource.h"

@interface BookList : NSObject<NSCoding,CommunicationDelegate>


@property (strong, nonatomic) NSMutableArray *bookListArray;
@property (strong, nonatomic) CommunicationSource *communtcation;


- (void)request:(NSString *)bookSpecies;

- (BOOL)unarchiveBookListArray;
- (Book *)indexBookModel:(NSInteger)index;
- (NSInteger)countOfBookListArray;


@end
