//
//  EducationViewController.h
//  PopoverControl
//
//  Created by Игорь Талов on 20.05.16.
//  Copyright © 2016 Игорь Талов.
//

#import <UIKit/UIKit.h>
@protocol EducationViewControllerdelegate;

@interface EducationViewController : UIViewController
@property(weak, nonatomic) IBOutlet UIPickerView* educationPicker;
@property(strong, nonatomic)NSArray* dataSource;
@property(weak, nonatomic) id <EducationViewControllerdelegate> delegate;
-(IBAction)doneAction:(UIBarButtonItem* )sender;

@end
@protocol EducationViewControllerdelegate <NSObject>

@required

-(void)setEducationInTextFieldFromPicker:(NSString* )string;

@end