//
//  tableViewController.m
//  Project_1
//
//  Created by rjtorr1 on 10/28/14.
//  Copyright (c) 2014 rjtorr1. All rights reserved.
//

#import "tableViewController.h"
#import "newTableViewCell.h"

@interface tableViewController ()

@property NSString *detailTextKey;
@property int score;

@end

@implementation tableViewController

- (id)initWithCoder:(NSCoder *)aCoder {
    
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Pick_Em";
        self.textKey = @"UserName";
        self.detailTextKey = @"Score";

        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.contentInset = UIEdgeInsetsMake(20.0f, 0.0f, 0.0f, 0.0f);
    
    [self.tableView registerNib:[UINib nibWithNibName:@"formattedCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"PostCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"PostCell";
    
    newTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell
    //cell.textLabel.text = [object objectForKey:self.textKey];

    cell.userName.text = [object objectForKey:self.textKey];
    self.score = [[object objectForKey:self.detailTextKey]intValue];
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"Score: %d", self.score];
    cell.score.text = [NSString stringWithFormat:@"Score: %d", self.score];
    
    return cell;
}

/*
// GET THIS TO WORK
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *CellIdentifier = @"Simple";
    
    newTableViewCell *cell = (newTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // Configure the cell
    cell.userName.text = [object objectForKey:self.textKey];
    
    self.score = [[object objectForKey:self.detailTextKey]intValue];
    cell.score.text = [NSString stringWithFormat:@"Score: %d", self.score];
    
    return cell;
}
*/

@end
