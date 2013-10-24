//
//  BookModel.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-23.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookModel : NSObject<NSCoding>





@property(nonatomic,strong) NSString *url; //url
@property(nonatomic,strong) NSString *alt; //alt
@property(nonatomic,strong) NSString *publisher;//publisher
@property(nonatomic,strong) NSString *catalog;//catalog
@property(nonatomic,strong) NSString *binding;//binding;
@property(nonatomic,strong) NSString *origin_title;//origin_title
@property(nonatomic,strong) NSString *bookId; // id
@property(nonatomic,strong) NSString *pages; //pages
@property(nonatomic,strong) NSString *price; //price
@property(nonatomic,strong) NSString *isbn13 ; //isbn13
@property(nonatomic,strong) NSString *alt_title;//alt_title
@property(nonatomic,strong) NSString *author_intro; //author_intro
@property(nonatomic,strong) NSString *title; //title
@property(nonatomic,strong) NSString *summary; //summary
@property(nonatomic,strong) NSString *subtitle; //subtitle
@property(nonatomic,strong) NSString *pubdate; //pubdate
@property(nonatomic,strong) NSString *isbn10;//isbn10
@property(nonatomic,strong) NSString *image; //image;

@end
