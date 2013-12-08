//
//  TableViewCell.m
//  UItableview
//
//  Created by ranjoy on 12/8/13.
//  Copyright (c) 2013 ranjoy. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize _firstNameUIL;
@synthesize _isVisibleUIL;
@synthesize _cellButtonUIB;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        //self._firstNameUIL
        self._firstNameUIL =[[UILabel alloc]init];
        [self._firstNameUIL setFrame:CGRectMake(0, 0, 100, 100)];
        [self._firstNameUIL setBackgroundColor:[UIColor clearColor]];
        [self._firstNameUIL setTextAlignment:NSTextAlignmentLeft];
        [self._firstNameUIL setFont:[UIFont boldSystemFontOfSize:15.0]];
        [self.contentView addSubview:self._firstNameUIL];
        
        //self._isVisibleUIL
        self._isVisibleUIL =[[UILabel alloc]init];
        [self._isVisibleUIL setFrame:CGRectMake(100, 0, 100, 100)];
        [self._isVisibleUIL setBackgroundColor:[UIColor clearColor]];
        [self._isVisibleUIL setTextAlignment:NSTextAlignmentLeft];
        [self._isVisibleUIL setFont:[UIFont boldSystemFontOfSize:15.0]];
        [self.contentView addSubview:self._isVisibleUIL];
        
        //self._cellButtonUIB
        self._cellButtonUIB =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self._cellButtonUIB setFrame:CGRectMake(200, 0.0f, 120, 100)];
        [self._cellButtonUIB setTitle:@"Click" forState:UIControlStateNormal];
        [self._cellButtonUIB setTitleColor:[UIColor colorWithRed:0.7 green:0 blue:0 alpha:1.0] forState:UIControlStateNormal];
        [self._cellButtonUIB setTitleColor:[UIColor colorWithRed:0.7 green:0 blue:0 alpha:1.0] forState:UIControlStateHighlighted];
        [[self._cellButtonUIB titleLabel] setFont:[UIFont boldSystemFontOfSize:23]];
        self._cellButtonUIB.tintColor=[UIColor lightGrayColor];
        [self.contentView addSubview:self._cellButtonUIB];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
