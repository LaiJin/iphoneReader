//
//  Rating.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-24.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rating : NSObject<NSCoding>


@property (strong, nonatomic) NSNumber *average;
@property (strong, nonatomic) NSNumber *max;
@property (strong, nonatomic) NSNumber *min;
@property (strong, nonatomic) NSNumber *numRaters;


@end
