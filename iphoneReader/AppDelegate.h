//
//  AppDelegate.h
//  iphoneReader
//
//  Created by xyooyy on 13-10-22.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InCodeMappingProvider.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) InCodeMappingProvider *inCodeMappingProvider;


@end
