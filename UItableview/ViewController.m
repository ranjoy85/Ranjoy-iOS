//
//  ViewController.m
//  UItableview
//
//  Created by ranjoy on 12/7/13.
//  Copyright (c) 2013 ranjoy. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

#define FIRSTNAME   1000
#define VISIBLE    1001

#define keyFirstName    @"Name"
#define keyIsVisible    @"Visible"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray * _NSA;
    UITableView * _UITableView;
}
@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //_NSA
    _NSA = [[NSMutableArray alloc] init];
    
    //add objects
    int i = 0;
    for(i = 0; i< 20; i++)
    {
        [_NSA addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                         [NSString stringWithFormat:@"Name - %d", i], keyFirstName,
                         @"YES", keyIsVisible,
                         nil]];
    }
    
    //_UITableView
    _UITableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,320,480) style:UITableViewStylePlain];
    _UITableView.dataSource = self;
    _UITableView.delegate = self;
    
    [self.view addSubview:_UITableView];
    
	// Do any additional setup after loading the view, typically from a nib.
}

// Default is 1 you can change as per your requirements.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

// If there is more than one section then add check for section =0,1,2,3 and return accordingly

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_NSA count];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}
// Add cell value from your array or static(As per requirements)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell-%d", indexPath.row];
    
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        ;
        
    } else {
        
        //_firstNameUIL =(UILabel *)[cell.contentView viewWithTag:FIRSTNAME];
        //_cellButtonUIB =(UIButton *)[cell.contentView viewWithTag:indexPath.row];
        //_isVisibleUIL = (UILabel *)[cell.contentView viewWithTag:VISIBLE];
    }
    
    cell._firstNameUIL.tag = FIRSTNAME;
    [cell._firstNameUIL setText:[[_NSA objectAtIndex:indexPath.row] objectForKey:keyFirstName]];
    cell._isVisibleUIL.tag = VISIBLE;
    [cell._isVisibleUIL setText:[[_NSA objectAtIndex:indexPath.row] objectForKey:keyIsVisible]];
    cell._cellButtonUIB.tag = indexPath.row;
    
    [cell._cellButtonUIB addTarget:self action:@selector(increaseItemCount:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    return cell;
    
}

- (IBAction)increaseItemCount:(UIButton*)sender
{
    UITableViewCell* cell = (UITableViewCell*)sender.superview.superview;
    NSIndexPath *indexPath = [_UITableView indexPathForCell:cell];

    NSMutableDictionary * _NSD = [_NSA objectAtIndex:indexPath.row];
    
    if([[_NSD objectForKey:keyIsVisible] isEqualToString:@"YES"])
    {
        [_NSD removeObjectForKey:keyIsVisible];
        [_NSD setValue:@"NO" forKey:keyIsVisible];
    }
    else
    {
        {
            [_NSD removeObjectForKey:keyIsVisible];
            [_NSD setValue:@"YES" forKey:keyIsVisible];
        }
    }
    //_visibleUIL
    UILabel * _visibleUIL = (UILabel *) [cell viewWithTag: VISIBLE];
    _visibleUIL.text = [[_NSA objectAtIndex:indexPath.row] objectForKey:keyIsVisible];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
