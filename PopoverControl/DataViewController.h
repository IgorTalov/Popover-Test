//
//  DataViewController.h
//  PopoverControl
//
//  Created by Игорь Талов on 20.05.16.
//  Copyright © 2016 Игорь Талов.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController
@property(weak, nonatomic) IBOutlet UIBarButtonItem* doneButton;

-(IBAction)doneAction:(UIBarButtonItem* )sender;


@end
