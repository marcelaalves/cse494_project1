//
//  PicksViewController.h
//  Project_1
//
//  Created by rjtorr1 on 11/5/14.
//  Copyright (c) 2014 rjtorr1. All rights reserved.
//

#import <Parse/Parse.h>
#import "Match.h"

@interface PicksViewController : PFQueryTableViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *listOfTeams;

- (IBAction)newPost:(id)sender;

@property NSString *username;

@end
