//
//  ViewController.h
//  Project_1
//
//  Created by rjtorr1 on 10/28/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>


@property NSString *currentusername;

@end
