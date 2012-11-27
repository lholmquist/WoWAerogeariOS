//
//  LPHPVPDetailViewController.m
//  WoWAerogearIOS
//
//  Created by Lucas Holmquist on 11/27/12.
//  Copyright (c) 2012 Lucas Holmquist. All rights reserved.
//

#import "LPHPVPDetailViewController.h"

@interface LPHPVPDetailViewController ()

@end

@implementation LPHPVPDetailViewController {
     NSArray* _pvpKeys;
}

@synthesize realm;
@synthesize pvpDetailViewController;

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
    _pvpKeys = [realm allKeys];
    
    [self.pvpDetailViewController reloadData];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_pvpKeys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"OtherCell";
    UITableViewCell *cell;
    NSUInteger row = [indexPath row];
    
    NSString* key = [_pvpKeys objectAtIndex:row];
    
    if( [[realm objectForKey:key] isKindOfClass:[NSDictionary class]])
    {
        cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
    }
    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        }
    }
    
    
    if( [[realm objectForKey:key] isKindOfClass:[NSDictionary class]])
    {
        cell.textLabel.text = key;
    }
    else if([[realm objectForKey:key] isKindOfClass:[NSNumber class]])
    {
        cell.textLabel.text = [key stringByAppendingString:@" Int "];
    }
    else if([[realm objectForKey:key] isKindOfClass:[NSString class]])
    {
        cell.textLabel.text = [key stringByAppendingString:[realm objectForKey:key]];
    }
    
    return cell;
}


@end
