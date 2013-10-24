//
//  book.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-24.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface book : NSObject<NSCoding>


@property (strong, nonatomic) NSString *alt;
@property (strong, nonatomic) NSString *alt_title;
@property (strong, nonatomic) NSString *author_intro;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *origin_titile;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *pubdata;
@property (strong, nonatomic) NSString *publisher;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *url;

@property (strong, nonatomic) NSNumber *book_id;
@property (strong, nonatomic) NSNumber *isbn10;
@property (strong, nonatomic) NSNumber *isbn13;
@property (strong, nonatomic) NSNumber *pages;

@property (strong, nonatomic) NSMutableArray *author;
@property (strong, nonatomic) NSMutableArray *tags;
@property (strong, nonatomic) NSMutableArray *translator;


@end
