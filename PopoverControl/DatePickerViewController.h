//
//  DatePickerViewController.h
//  PopoverControl
//
//  Created by Игорь Талов on 20.05.16.
//  Copyright © 2016 Игорь Талов. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DatePickerViewControllerDelegate;

@interface DatePickerViewController : UIViewController

@property(weak, nonatomic) IBOutlet UIDatePicker* datePicker;
@property(weak, nonatomic) id <DatePickerViewControllerDelegate> delegate;

-(IBAction)doneAction:(UIBarButtonItem* )sender;
- (IBAction)dateChange:(UIDatePicker *)sender;

@end

@protocol DatePickerViewControllerDelegate <NSObject>

-(void)setDateFromDatePicker:(NSString* )string;

@end