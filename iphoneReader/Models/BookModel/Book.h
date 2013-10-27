//
//  book.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-24.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Image.h"
#import "Rating.h" 

@interface Book : NSObject<NSCoding>

//下面book的属性名必须和网页上的key相同,这样才可以被Mapping 如果属性值无法设置时也可以用以下类似的语句来改变key值的Mapping    [self.inCodeMappingProvider mapFromDictionaryKey:@"id" toPropertyKey:@"book_id" forClass:[Book class]];

@property (strong, nonatomic) NSString *alt;
@property (strong, nonatomic) NSString *alt_title;
@property (strong, nonatomic) NSString *author_intro;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *origin_title;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *pubdate;
@property (strong, nonatomic) NSString *publisher;
@property (strong, nonatomic) NSString *subtitle;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *pages;
@property (strong, nonatomic) NSString *catalog;
@property (strong, nonatomic) NSString *binding;

@property (strong, nonatomic) NSNumber *book_id;
@property (strong, nonatomic) NSNumber *isbn10;
@property (strong, nonatomic) NSNumber *isbn13;

@property (strong, nonatomic) NSMutableArray *author;
@property (strong, nonatomic) NSMutableArray *tags;
@property (strong, nonatomic) NSMutableArray *translator;

@property (strong, nonatomic) Image *images;
@property (strong, nonatomic) Rating *rating;


@end
