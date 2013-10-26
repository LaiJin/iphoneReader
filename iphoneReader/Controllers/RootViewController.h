//
//  RootViewController.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-23.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "BookList.h"

@interface RootViewController : UIViewController<ASIHTTPRequestDelegate>{
    
    BookList *bookList;
}



@end
