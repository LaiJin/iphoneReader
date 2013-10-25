//
//  ImageSize.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-24.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Image : NSObject<NSCoding>

@property (strong, nonatomic) NSString *large;
@property (strong, nonatomic) NSString *medium;
@property (strong, nonatomic) NSString *small;


@end
