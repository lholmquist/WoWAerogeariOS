//
//  LPHDetailViewController.h
//  WoWAerogearIOS
//
//  Created by Lucas Holmquist on 11/15/12.
//  Copyright (c) 2012 Lucas Holmquist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPHDetailViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property id realm;
@property IBOutlet UITableView *realmDetailView;

@end
