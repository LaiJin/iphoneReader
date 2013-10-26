//
//  Tags.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-24.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "Tags.h"

@implementation Tags

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.count forKey:@"tags_count"];
    [aCoder encodeObject:self.name forKey:@"tags_name"];
    [aCoder encodeObject:self.title forKey:@"tags_title"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    if (self) {
        self.count = [aDecoder decodeObjectForKey:@"tags_count"];
        self.name = [aDecoder decodeObjectForKey:@"tags_name"];
        self.title = [aDecoder decodeObjectForKey:@"tags_title"];
    }
    return self;
}





@end
