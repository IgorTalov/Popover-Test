//
//  DataTableViewController.m
//  PopoverControl
//
//  Created by Игорь Талов on 20.05.16.
//  Copyright © 2016 Игорь Талов. All rights reserved.
//

#import "DataTableViewController.h"
#import "DataViewController.h"
#import "EducationViewController.h"
#import "DatePickerViewController.h"

@interface DataTableViewController () <UIPopoverControllerDelegate, UITextFieldDelegate, EducationViewControllerdelegate, DatePickerViewControllerDelegate>

@property(strong, nonatomic)UIPopoverController* popover;
@end

@implementation DataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark - Actions

-(IBAction)infoAction:(UIBarButtonItem* )sender{
    
    DataViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [self showController:vc];
    } else {
        [self showInfoViewController:vc];
    }
    
}

#pragma mark - Show Popover Or Controller

-(void)showController:(UIViewController* )vc {

    vc.preferredContentSize = CGSizeMake(300, 300);
    
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    UIPopoverController* popover = [[UIPopoverController alloc]initWithContentViewController:nav];

    popover.delegate = self;
    self.popover = popover;
    
        [popover presentPopoverFromBarButtonItem:self.infoButton
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];

}

-(void)showInfoViewController:(UIViewController* )vc{
    
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    
    NSLog(@"popover deallocated");
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    if (textField.tag == 4) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            EducationViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EducationViewController"];
            vc.preferredContentSize = CGSizeMake(300, 300);
            vc.delegate = self;
  
            UIPopoverController* popover = [[UIPopoverController alloc]initWithContentViewController:vc];
            
            popover.delegate = self;
            self.popover = popover;
            
            
           CGRect rect = [self.view convertRect:textField.bounds fromView:textField];
            
            [popover presentPopoverFromRect:rect
                                     inView:self.view
                   permittedArrowDirections:UIPopoverArrowDirectionUp
                                   animated:YES];
            
            return NO;
        } else {
        EducationViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EducationViewController"];
            vc.delegate = self;
            
            [self showInfoViewController:vc];
            return NO;
        }
        
    } else if (textField.tag == 3) {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            DatePickerViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DatePickerViewController"];
            vc.preferredContentSize = CGSizeMake(300, 300);
            vc.delegate = self;
            
            UIPopoverController* popover = [[UIPopoverController alloc]initWithContentViewController:vc];
            
            popover.delegate = self;
            self.popover = popover;

            CGRect rect = [self.view convertRect:textField.bounds fromView:textField];
            
            [popover presentPopoverFromRect:rect
                                     inView:self.view
                   permittedArrowDirections:UIPopoverArrowDirectionUp
                                   animated:YES];
            
            return NO;
        } else {
            DatePickerViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DatePickerViewController"];
            vc.delegate = self;
            [self showInfoViewController:vc];
            return NO;
        }
    }
    return YES;
}

#pragma mark - EducationViewControllerdelegate

-(void)setEducationInTextFieldFromPicker:(NSString* )string{
    self.educationTextField.text = string;
}

#pragma mark - DatePickerViewControllerDelegate

-(void)setDateFromDatePicker:(NSString* )string;{
    self.birthDateTextField.text = string;
}
@end
