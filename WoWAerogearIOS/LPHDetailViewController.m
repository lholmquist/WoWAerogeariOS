//
//  LPHDetailViewController.m
//  WoWAerogearIOS
//
//  Created by Lucas Holmquist on 11/15/12.
//  Copyright (c) 2012 Lucas Holmquist. All rights reserved.
//

#import "LPHDetailViewController.h"

@interface LPHDetailViewController ()

@end

@implementation LPHDetailViewController

@synthesize realmLabel;
@synthesize realmName;
@synthesize realm;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    realmLabel.text = realmName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
