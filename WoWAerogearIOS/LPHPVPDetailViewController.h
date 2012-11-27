//
//  LPHPVPDetailViewController.h
//  WoWAerogearIOS
//
//  Created by Lucas Holmquist on 11/27/12.
//  Copyright (c) 2012 Lucas Holmquist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPHPVPDetailViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property id realm;
@property IBOutlet UITableView *pvpDetailViewController;

@end
