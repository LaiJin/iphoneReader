//
//  CommunicationDelegate.h
//  iphoneReader
//
//  Created by xyooyy on 13-11-2.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommunicationDelegate <NSObject>

@required
- (void)parseComplete:(NSMutableArray *)books;


@end
