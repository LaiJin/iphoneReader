//
//  CommunicationSource.h
//  iphoneReader
//
//  Created by xyooyy on 13-11-1.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

@interface CommunicationSource : NSObject<ASIHTTPRequestDelegate>


- (void)requestURL:(NSString *)bookType;

@end
