//
//  DatePickerViewController.m
//  PopoverControl
//
//  Created by Игорь Талов on 20.05.16.
//  Copyright © 2016 Игорь Талов.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Actions

-(IBAction)doneAction:(UIBarButtonItem* )sender{

    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd MMM yyyy"];
    NSString* string = [formatter stringFromDate:self.datePicker.date];
    [self.delegate setDateFromDatePicker:string];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)dateChange:(UIDatePicker *)sender {
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd MMM yyyy"];
    NSString* string = [formatter stringFromDate:self.datePicker.date];
    [self.delegate setDateFromDatePicker:string];
    NSLog(@"%@", string);
    NSLog(@"Log");
    //====
}


@end
