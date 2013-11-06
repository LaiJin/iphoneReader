//
//  LeftViewController.m
//  iphoneReader
//
//  Created by xyooyy on 13-11-6.
//  Copyright (c) 2013年 lunajin. All rights reserved.
//

#import "LeftViewController.h"
#import "BookListTableViewCell.h"
#import "RootViewController.h"


@interface LeftViewController ()

@end

@implementation LeftViewController



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(obtainleftDisplayBooks:) name:@"leftDisplayBooks" object:nil];
    }
    return self;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.tableView setSeparatorColor:[UIColor colorWithRed:49.0/255.0
                                                      green:54.0/255.0
                                                       blue:57.0/255.0
                                                      alpha:1.0]];
    [self.tableView setBackgroundColor:[UIColor colorWithRed:77.0/255.0
                                                       green:79.0/255.0
                                                        blue:80.0/255.0
                                                       alpha:1.0]];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Private Methods
- (void)obtainleftDisplayBooks:(NSNotification *)notification
{
    leftDispalyBooks = [NSMutableArray arrayWithArray:[notification object]];
    [self.tableView reloadData];
    
}


#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [leftDispalyBooks count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    //cell.backgroundColor = [UIColor blackColor]
    return cell;
    
}


#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case MMDrawerSectionViewSelection:{
            RootViewController * center = [[RootViewController alloc] init];
            
            UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:center];
            
            if(indexPath.row%2==0){
                [self.mm_drawerController
                 setCenterViewController:nav
                 withCloseAnimation:YES
                 completion:nil];
            }
            else {
                [self.mm_drawerController
                 setCenterViewController:nav
                 withFullCloseAnimation:YES
                 completion:nil];
            }
            break;
        }
            
        case MMDrawerSectionDrawerWidth:{
            //Implement in Subclass
            break;
        }
        case MMDrawerSectionShadowToggle:{
            [self.mm_drawerController setShowsShadow:!self.mm_drawerController.showsShadow];
            [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
            break;
        }
        case MMDrawerSectionOpenDrawerGestures:{
            switch (indexPath.row) {
                case 0:
                    self.mm_drawerController.openDrawerGestureModeMask ^= MMOpenDrawerGestureModePanningNavigationBar;
                    break;
                case 1:
                    self.mm_drawerController.openDrawerGestureModeMask ^=  MMOpenDrawerGestureModePanningCenterView;
                    break;
                case 2:
                    self.mm_drawerController.openDrawerGestureModeMask ^=  MMOpenDrawerGestureModeBezelPanningCenterView;
                    break;
                default:
                    break;
            }
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            break;
        }
        case MMDrawerSectionCloseDrawerGestures:{
            switch (indexPath.row) {
                case 0:
                    self.mm_drawerController.closeDrawerGestureModeMask ^= MMCloseDrawerGestureModePanningNavigationBar;
                    break;
                case 1:
                    self.mm_drawerController.closeDrawerGestureModeMask ^= MMCloseDrawerGestureModePanningCenterView;
                    break;
                case 2:
                    self.mm_drawerController.closeDrawerGestureModeMask ^= MMCloseDrawerGestureModeBezelPanningCenterView;
                    break;
                case 3:
                    self.mm_drawerController.closeDrawerGestureModeMask ^= MMCloseDrawerGestureModeTapNavigationBar;
                    break;
                case 4:
                    self.mm_drawerController.closeDrawerGestureModeMask ^= MMCloseDrawerGestureModeTapCenterView;
                    break;
                case 5:
                    self.mm_drawerController.closeDrawerGestureModeMask ^= MMCloseDrawerGestureModePanningDrawerView;
                    break;
                default:
                    break;
            }
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            break;
        }
        case MMDrawerSectionCenterHiddenInteraction:{
            self.mm_drawerController.centerHiddenInteractionMode = indexPath.row;
            [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
            break;
        }
        case MMDrawerSectionStretchDrawer:{
            self.mm_drawerController.shouldStretchDrawer = !self.mm_drawerController.shouldStretchDrawer;
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            break;
        }
        default:
            break;
    }
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}





#pragma mark -
#pragma mark Dealloc Methods
- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"leftDisplayBooks" object:nil];
    
}

@end
