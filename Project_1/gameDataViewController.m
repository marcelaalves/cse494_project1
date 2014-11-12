//
//  gameDataViewController.m
//  Project_1
//
//  Created by rjtorr1 on 11/5/14.
//  Copyright (c) 2014 rjtorr1. All rights reserved.
//

#import "gameDataViewController.h"

@interface gameDataViewController ()

- (IBAction)games:(id)sender;
- (IBAction)scores:(id)sender;

@end

@implementation gameDataViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)games:(id)sender {
}

- (IBAction)scores:(id)sender {
}
@end
