//
//  ViewController_2.m
//  Project_1
//
//  Created by rjtorr1 on 10/28/14.
//  Copyright (c) 2014 rjtorr1. All rights reserved.
//

#import "ViewController_2.h"
#import <Parse/Parse.h>

@interface ViewController_2 ()

@property NSString *className, *objectID;
@property PFQuery *query;
@property PFObject *retrieve;

- (IBAction)games:(id)sender;
- (IBAction)scores:(id)sender;

@end

@implementation ViewController_2

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
    self.query = [PFQuery queryWithClassName:@"Games"];
    self.retrieve = [self.query getObjectWithId:@"K2UBbQlgNl"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)games:(id)sender {
    
    self.favorites = [[self.retrieve objectForKey:@"Favorites"] mutableCopy];
    if(!self.favorites)
    {
        self.favorites = [[NSMutableArray alloc] init];
    }
    
    self.dogs = [[self.retrieve objectForKey:@"Dogs"] mutableCopy];
    if(!self.dogs)
    {
        self.dogs = [[NSMutableArray alloc] init];
    }
    
    NSLog(@"Dogs: %@", self.dogs);
}

- (IBAction)scores:(id)sender {
    
    self.winners = [[self.retrieve objectForKey:@"Winners"] mutableCopy];
    if(!self.winners)
    {
        self.winners= [[NSMutableArray alloc] init];
    }
    NSLog(@"Scores: %@", self.winners);
}

@end
