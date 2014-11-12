//
//  SimpleTableCell.h
//  Project_1
//
//  Created by rjtorr1 on 11/5/14.
//  Copyright (c) 2014 rjtorr1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

@property (nonatomic,weak) NSString * chosen;

@property (weak, nonatomic) IBOutlet UILabel *favorite;
@property (weak, nonatomic) IBOutlet UILabel *underdog;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;


@end
