//
//  TableViewCell.h
//  UItableview
//
//  Created by ranjoy on 12/8/13.
//  Copyright (c) 2013 ranjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
{
    UILabel *_firstNameUIL;
    UILabel *_isVisibleUIL;
    UIButton *_cellButtonUIB;
}

@property (nonatomic, strong)UILabel *_firstNameUIL;
@property (nonatomic, strong)UILabel *_isVisibleUIL;
@property (nonatomic, strong)UIButton *_cellButtonUIB;

@end
