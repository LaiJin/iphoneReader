//
//  BookList.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-26.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BookList : NSObject{
    
    NSArray *bookListArray;
    
}
    
    
    


-(void)getURLInBackground :(UIViewController *)rootViewController;
-(void)getBookListArray :(NSMutableArray *)bookListMutableArray;


@end
