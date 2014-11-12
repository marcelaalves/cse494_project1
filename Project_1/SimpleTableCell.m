//
//  SimpleTableCell.m
//  Project_1
//
//  Created by rjtorr1 on 11/5/14.
//  Copyright (c) 2014 rjtorr1. All rights reserved.
//

#import "SimpleTableCell.h"

@implementation SimpleTableCell

- (IBAction)pickTeam:(id)sender {
    int op =  (int)self.segmentControl.selectedSegmentIndex;
    if(op == 0)
    {
        self.chosen = self.favorite.text;
    }
    else{
        self.chosen = self.underdog.text;
    }
   
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    self.chosen = self.favorite.text;
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}



@end
