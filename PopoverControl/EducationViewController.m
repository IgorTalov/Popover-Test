//
//  EducationViewController.m
//  PopoverControl
//
//  Created by Игорь Талов on 20.05.16.
//  Copyright © 2016 Игорь Талов. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property(strong, nonatomic) NSString* string;
@end

@implementation EducationViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.string = nil;
    self.dataSource = @[@"Неполное среднее",@"Среднее",@"Неполное высшее",@"Высшее"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.dataSource objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.dataSource count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.string = [self.dataSource objectAtIndex:row];
    [self.delegate setEducationInTextFieldFromPicker:self.string];
}

#pragma mark - Actions

-(IBAction)doneAction:(UIBarButtonItem *)sender{
    
    [self.delegate setEducationInTextFieldFromPicker:self.string];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
