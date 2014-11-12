//
//  PicksViewController.m
//  Project_1
//
//  Created by rjtorr1 on 11/5/14.
//  Copyright (c) 2014 rjtorr1. All rights reserved.
//

#import "PicksViewController.h"
#import "SimpleTableCell.h"
#import "ViewController.h"

@interface PicksViewController ()

@property PFQuery *query;
@property PFObject *retrieve;




@end

@implementation PicksViewController


NSArray *tableDataFavorite;
NSArray *tableDataUnderdog;

NSMutableArray * picks;
NSMutableArray * mypicksChosen;

- (id) initWithCoder:(NSCoder *)aCoder{
    picks = [[NSMutableArray alloc] init];
    mypicksChosen = [[NSMutableArray alloc] init];
    
    self = [super initWithCoder:aCoder];
    if(self)
    {
        self.parseClassName = @"Pick_Em";
        self.textKey = @"Picks";
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LoadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableDataFavorite count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    
    cell.favorite.text = [tableDataFavorite objectAtIndex:indexPath.row];
    cell.underdog.text = [tableDataUnderdog objectAtIndex:indexPath.row];
    cell.chosen = cell.favorite.text ;
    
    NSInteger count = [picks count]; // change NSInteger
    NSInteger  count2 = [tableDataFavorite count];
    if(count < count2){
        [picks addObject:cell ];
    }
    
    
    return cell;
}





-(void) LoadData{
    
    self.query = [[PFQuery alloc] initWithClassName:@"Games"];
    self.retrieve = [self.query getObjectWithId:@"K2UBbQlgNl"];
    
    tableDataFavorite = [[self.retrieve objectForKey:@"Favorites"] mutableCopy];
    if(!tableDataFavorite)
    {
        tableDataFavorite = [[NSMutableArray alloc] init];
    }
    
    tableDataUnderdog = [[self.retrieve objectForKey:@"Dogs"] mutableCopy];
    if(!tableDataUnderdog )
    {
        tableDataUnderdog  = [[NSMutableArray alloc] init];
    }
    
}

- (IBAction)newPost:(id)sender {
    
    for (SimpleTableCell * pick in picks) {
        
        [mypicksChosen  addObject:pick.chosen];
    }
    
    PFQuery *query = [[PFQuery alloc] initWithClassName:self.parseClassName];
    [query whereKey:@"UserName" equalTo:self.username];
    
    
    NSArray *objects = [query findObjects];
    PFObject *post;
    
    if(objects.count >0)
    {
        post = objects[0];
    }
    else
    {
        post = [PFObject objectWithClassName:self.parseClassName];
        NSLog(@"UserName: %@",self.username);
        post[@"UserName"] = self.username;
    }
    
    [post setObject:mypicksChosen forKey:self.textKey];
    [post save];
    
    mypicksChosen = [[NSMutableArray alloc] init];
}
@end
