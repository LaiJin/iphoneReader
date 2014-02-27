//
//  CommunicationSource.h
//  iphoneReader
//
//  Created by xyooyy on 13-11-1.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "CommunicationDelegate.h"

@interface CommunicationSource : NSObject<ASIHTTPRequestDelegate>


@property (nonatomic, weak) id<CommunicationDelegate>communicationDelegate;


- (void)requestURL:(NSString *)bookURL;

@end
