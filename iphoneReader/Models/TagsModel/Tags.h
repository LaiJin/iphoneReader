//
//  Tags.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-24.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tags : NSObject<NSCoding>

@property (strong,nonatomic) NSNumber *count;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *title;

@end
