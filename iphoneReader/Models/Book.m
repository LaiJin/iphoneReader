//
//  book.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-24.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "Book.h"

@implementation Book

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.alt forKey:@"book_alt"];
    [aCoder encodeObject:self.alt_title forKey:@"book_alt_title"];
    [aCoder encodeObject:self.author_intro forKey:@"book_author_intro"];
    [aCoder encodeObject:self.image forKey:@"book_image"];
    [aCoder encodeObject:self.origin_title forKey:@"book_origin_title"];
    [aCoder encodeObject:self.price forKey:@"book_price"];
    [aCoder encodeObject:self.pubdate forKey:@"book_pubdate"];
    [aCoder encodeObject:self.publisher forKey:@"book_publisher"];
    [aCoder encodeObject:self.subtitle forKey:@"book_subtitle"];
    [aCoder encodeObject:self.summary forKey:@"book_summary"];
    [aCoder encodeObject:self.title forKey:@"book_title"];
    [aCoder encodeObject:self.url forKey:@"book_url"];
    [aCoder encodeObject:self.book_id forKey:@"book_id"];
    [aCoder encodeObject:self.isbn10 forKey:@"book_isbn10"];
    [aCoder encodeObject:self.isbn13 forKey:@"book_isbn13"];
    [aCoder encodeObject:self.pages forKey:@"book_pages"];
    [aCoder encodeObject:self.catalog forKey:@"book_catalog"];
    [aCoder encodeObject:self.binding forKey:@"book_binding"];
    [aCoder encodeObject:self.author forKey:@"book_author"];
    [aCoder encodeObject:self.tags forKey:@"book_tags"];
    [aCoder encodeObject:self.translator forKey:@"book_translator"];
    [aCoder encodeObject:self.images forKey:@"book_images"];
    [aCoder encodeObject:self.rating forKey:@"book_rating"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        self.alt = [aDecoder decodeObjectForKey: @"book_alt"];
        self.alt_title = [aDecoder decodeObjectForKey: @"book_alt_title"];
        self.author_intro = [aDecoder decodeObjectForKey: @"book_author_intro"];
        self.image = [aDecoder decodeObjectForKey: @"book_image"];
        self.origin_title = [aDecoder decodeObjectForKey: @"book_origin_title"];
        self.price = [aDecoder decodeObjectForKey: @"book_price"];
        self.pubdate = [aDecoder decodeObjectForKey: @"book_pubdate"];
        self.publisher = [aDecoder decodeObjectForKey: @"book_publisher"];
        self.subtitle = [aDecoder decodeObjectForKey: @"book_subtitle"];
        self.summary = [aDecoder decodeObjectForKey: @"book_summary"];
        self.title = [aDecoder decodeObjectForKey: @"book_title"];
        self.url = [aDecoder decodeObjectForKey: @"book_url"];
        self.book_id = [aDecoder decodeObjectForKey: @"book_id"];
        self.isbn10 = [aDecoder decodeObjectForKey: @"book_isbn10"];
        self.isbn13 = [aDecoder decodeObjectForKey: @"book_isbn13"];
        self.pages = [aDecoder decodeObjectForKey: @"book_pages"];
        self.author = [aDecoder decodeObjectForKey: @"book_author"];
        self.catalog = [aDecoder decodeObjectForKey:@"book_catalog"];
        self.binding = [aDecoder decodeObjectForKey:@"book_binding"];
        self.tags = [aDecoder decodeObjectForKey: @"book_tags"];
        self.translator = [aDecoder decodeObjectForKey: @"book_translator"];
        self.images = [aDecoder decodeObjectForKey: @"book_images"];
        self.rating = [aDecoder decodeObjectForKey: @"book_rating"];
    }
    return self;
}

@end
