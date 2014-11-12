//
//  ViewController.m
//  Project_1
//
//  Created by rjtorr1 on 10/28/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "PicksViewController.h"

@interface ViewController ()

// TEMP ARRAY
//@property NSArray *names;

@property (nonatomic) NSMutableArray *favorites;
@property (nonatomic) NSMutableArray *dogs;
@property (nonatomic) NSMutableArray *winners;
@property (nonatomic) NSMutableArray *picks;

@property int score, currentWeek;
@property PFQuery *query;
@property PFObject *save, *retrieve;

- (IBAction)standings:(id)sender;
- (IBAction)logOut:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *week;
@property (weak, nonatomic) IBOutlet UITextField *currentUserName;
@property (weak, nonatomic) IBOutlet UITextField *currentScore;


@end

@implementation ViewController
@synthesize score, currentWeek;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    // LOAD FAVORITES, DOGS, AND WINNERS FROM PARSE
    self.query = [PFQuery queryWithClassName:@"Games"];
    self.retrieve = [self.query getObjectWithId:@"K2UBbQlgNl"];
    
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
    
    self.winners = [[self.retrieve objectForKey:@"Winners"] mutableCopy];
    if(!self.winners)
    {
        self.winners= [[NSMutableArray alloc] init];
    }

    
    
    
    
    
    // NO USER LOGGED IN
   PFUser *user = [PFUser currentUser];
    self.currentusername = user.username;
    
    
    if(!user){
        // CREATE LOG IN VIEW CONTROLLER
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc]init];
        [logInViewController setDelegate:self];
        
        // CREATE SIGN UP VIEW CONTROLLER
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc]init];
        [signUpViewController setDelegate:self];
        
        // ASSIGN SIGN UP CONTROLLER TO BE DISPLAYED FROM THE LOGIN CONROLLER
        [logInViewController setSignUpController:signUpViewController];
        
        // PRESENT LOG IN IN VIEW CONTROLLER
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
    else{
        self.currentUserName.text = self.currentusername;
        
        // LOAD WEEK FROM PARSE
        self.query = [PFQuery queryWithClassName:@"Games"];
        self.retrieve = [self.query getObjectWithId:@"K2UBbQlgNl"];
        self.currentWeek = [[self.retrieve objectForKey:@"Week"]integerValue];
        self.week.text = [NSString stringWithFormat:@"%d", self.currentWeek];
        
        // LOAD USER'S SCORE FROM PARSE
        self.query = [PFQuery queryWithClassName:@"Pick_Em"];
        [self.query whereKey:@"UserName" equalTo:self.currentusername];
        self.retrieve = [self.query getFirstObject];
        self.score = [[self.retrieve objectForKey:@"Score"]intValue];
        self.currentScore.text = [NSString stringWithFormat:@"%d", self.score];
        
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)standings:(id)sender {
    
    // LOAD USERS PICKS (ARRAY)
    self.query = [PFQuery queryWithClassName:@"Pick_Em"];
    [self.query whereKey:@"UserName" equalTo:self.currentusername];
    self.retrieve = [self.query getFirstObject];
    self.picks = [[self.retrieve objectForKey:@"Picks"]mutableCopy];
    
    int temp = self.picks.count;
    
    // GET A POINT IF USER MADE CORRECT PICK
    for(int i = 0; i<temp; i++)
    {
        if([self.picks[i] isEqualToString:self.winners[i]])
        {
            self.score += 1;
        }
    }
    
    // SAVE NEW SCORE TO PARSE
    NSNumber *new = [[NSNumber alloc]initWithInt:self.score];
    [self.retrieve setObject:new forKey:@"Score"];
    [self.retrieve save];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segue1"])
    {
        PicksViewController *destViewController = segue.destinationViewController;
        destViewController.username = self.currentusername;
    }
}



- (IBAction)logOut:(id)sender {
    [PFUser logOut];
}

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:Nil];
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    [self dismissViewControllerAnimated:YES completion:Nil];
}










@end
