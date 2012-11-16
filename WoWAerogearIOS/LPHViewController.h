//
//  LPHViewController.h
//  WoWAerogearIOS
//
//  Created by Lucas Holmquist on 11/15/12.
//  Copyright (c) 2012 Lucas Holmquist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPHViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property IBOutlet UITableView *realmTableView;

@end
