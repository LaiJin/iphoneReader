//
//  BookListTableViewCell.m
//  iphoneReader
//
//  Created by xyooyy on 13-10-27.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "BookListTableViewCell.h"

@implementation BookListTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        imageView = [[EGOImageView alloc]initWithPlaceholderImage:[UIImage imageNamed:@"placeholder.png"]];
        imageView.frame = CGRectMake(10, 10, 80, 100);
        bookTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 220, 36)];
        bookAuthorLabel = [[UILabel alloc]initWithFrame:CGRectMake(100,50, 220, 36)];
        [self.contentView addSubview:imageView];
        [self addSubview:bookTitleLabel];
        [self addSubview:bookAuthorLabel];
    }
    return self;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    
}


#pragma mark -
#pragma mark Public Methods
- (void)getImageViewUrl :(NSString *)url
{
    
    imageView.imageURL = [NSURL URLWithString:url];
    
}


- (void)getBookTitleLabelText :(NSString *)title
{
    
    bookTitleLabel.font = [UIFont boldSystemFontOfSize:15];
    bookTitleLabel.text = [NSString stringWithFormat:@"书名:%@",title];
    
}


- (void)getBookAuthorLabelText :(NSMutableArray *)author
{
    
    bookAuthorLabel.font = [UIFont boldSystemFontOfSize:15];
    if ([author count])
        bookAuthorLabel.text = [NSString stringWithFormat:@"作者:%@",[author objectAtIndex :0]];
    else
        bookAuthorLabel.text = nil;
    
}

@end
