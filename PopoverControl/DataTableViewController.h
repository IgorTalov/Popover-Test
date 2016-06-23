//
//  DataTableViewController.h
//  PopoverControl
//
//  Created by Игорь Талов on 20.05.16.
//  Copyright © 2016 Игорь Талов. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *educationTextField;

@property(weak, nonatomic) IBOutlet UIBarButtonItem* infoButton;

-(IBAction)infoAction:(UIBarButtonItem* )sender;

@end
