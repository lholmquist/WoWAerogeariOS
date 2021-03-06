//
//  LPHDetailViewController.m
//  WoWAerogearIOS
//
//  Created by Lucas Holmquist on 11/15/12.
//  Copyright (c) 2012 Lucas Holmquist. All rights reserved.
//

#import "LPHDetailViewController.h"
#import "LPHPVPDetailViewController.h"

@interface LPHDetailViewController ()

@end

@implementation LPHDetailViewController
{
    NSArray* _realmKeys;
}


@synthesize realm;
@synthesize realmDetailView;

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
    
    _realmKeys = [realm allKeys];
    
    [self.realmDetailView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_realmKeys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"OtherCell";
    static NSString *pvpTableIdentifier = @"PvPDetailCell";
    UITableViewCell *cell;
    NSUInteger row = [indexPath row];
    
    NSString* key = [_realmKeys objectAtIndex:row];
    
    if( [[realm objectForKey:key] isKindOfClass:[NSDictionary class]])
    {
        cell = [tableView dequeueReusableCellWithIdentifier:pvpTableIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:pvpTableIdentifier];
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pvpSegue"]) {
        NSString *senderText = [[sender textLabel] text];
        LPHPVPDetailViewController *destViewController = segue.destinationViewController;
        
        destViewController.realm = [realm valueForKey:senderText]; //passing the realm to the detail view
    }
}


@end
