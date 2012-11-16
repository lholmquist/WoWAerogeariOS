//
//  LPHViewController.m
//  WoWAerogearIOS
//
//  Created by Lucas Holmquist on 11/15/12.
//  Copyright (c) 2012 Lucas Holmquist. All rights reserved.
//

#import "LPHViewController.h"
#import "LPHDetailViewController.h"
#import "AeroGear.h"

@interface LPHViewController ()

@end

@implementation LPHViewController {
    NSArray* _realms;
}

@synthesize realmTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL* projectsURL = [NSURL URLWithString:@"http://us.battle.net/api/wow/"];
    
    id<AGPipe> realmPipe;
    
    AGPipeline *pipeline = [AGPipeline pipeline:projectsURL];
    
    realmPipe = [pipeline pipe:^(id<AGPipeConfig> config) {
        [config name:@"status"];
        [config endpoint: @"realm/status"];
        [config type:@"REST"];
    }];
    
    [realmPipe read:^(id responseObject) {
        _realms = [responseObject objectForKey:@"realms"]; //need to do this so we can get the array
        [self.realmTableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"An error has occured during fetch! \n%@", error);
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_realms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RealmCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    cell.textLabel.text = [[_realms objectAtIndex:row] objectForKey:@"name"];
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showRealmDetail"]) {
        NSIndexPath *indexPath = [self.realmTableView indexPathForSelectedRow];
        LPHDetailViewController *destViewController = segue.destinationViewController;
        
        NSUInteger row = [indexPath row];
        destViewController.realm = [_realms objectAtIndex:row];
        destViewController.realmName = [[_realms objectAtIndex:row] objectForKey:@"name"];
    }
}

@end
