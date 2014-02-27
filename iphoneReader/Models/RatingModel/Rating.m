//
//  Rating.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-24.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "Rating.h"

@implementation Rating

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:self.average forKey:@"rating_average"];
    [aCoder encodeObject:self.max forKey:@"rating_max"];
    [aCoder encodeObject:self.min forKey:@"rating_min"];
    [aCoder encodeObject:self.numRaters forKey:@"rating_numRates"];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super init];
    if (self)
    {
        self.average = [aDecoder decodeObjectForKey:@"rating_average"];
        self.max = [aDecoder decodeObjectForKey:@"rating_max"];
        self.min = [aDecoder decodeObjectForKey:@"rating_min"];
        self.numRaters = [aDecoder decodeObjectForKey:@"rating_numRates"];
    }
    return self;
    
}


@end
