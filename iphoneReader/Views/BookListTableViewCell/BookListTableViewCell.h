//
//  BookListTableViewCell.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-27.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageView.h"

@interface BookListTableViewCell : UITableViewCell<EGOImageViewDelegate>{
    
    EGOImageView *imageView;
    UILabel *bookTitleLabel;
    UILabel *bookAuthorLabel;
}

- (void)getImageViewUrl :(NSString *)url;
- (void)getBookTitleLabelText :(NSString *)title;
- (void)getBookAuthorLabelText :(NSMutableArray *)author;

@end
