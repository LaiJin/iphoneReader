//
//  ImageSize.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-24.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "Image.h"

@implementation Image


-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.large forKey:@"image_large"];
    [aCoder encodeObject:self.medium forKey:@"image_medium"];
    [aCoder encodeObject:self.small forKey:@"image_small"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        self.large = [aDecoder decodeObjectForKey:@"image_large"];
        self.medium = [aDecoder decodeObjectForKey:@"image_medium"];
        self.small = [aDecoder decodeObjectForKey:@"image_small"];
    }
    
    return self;
}


@end
