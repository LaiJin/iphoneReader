//
//  RootViewController.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-23.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookList.h"
#import "PullTableView.h"
#import "CommunicationSource.h"

@interface RootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,PullTableViewDelegate>{
    
    BookList *bookList;
    CommunicationSource *communicationSource;
    PullTableView *bookListTableView;
    
}



@end
