//
//  ViewController.m
//  PopoverControl
//
//  Created by Игорь Талов on 20.05.16.
//  Copyright © 2016 Игорь Талов. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController () <UIPopoverControllerDelegate>

@property(strong, nonatomic) UIPopoverController* popover;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)showModalController:(UIViewController* )vc{
    
    [self presentViewController:vc animated:YES completion:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self dismissViewControllerAnimated:YES completion:nil];
        });
    }];

}

-(void)showController:(UIViewController *)vc inPopoverFromSender:(id)sender {
    
    if (!sender) {
        return;
    }
    
    vc.preferredContentSize = CGSizeMake(300, 300);
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    UIPopoverController* popover = [[UIPopoverController alloc]initWithContentViewController:nav];
    
    popover.delegate = self;
    self.popover = popover;
    
    
    if ([sender isKindOfClass:[UIButton class]]) {
        [popover presentPopoverFromRect:[(UIButton* )sender frame]
                                 inView:self.view
               permittedArrowDirections: UIPopoverArrowDirectionAny
                               animated:YES];
    } else if ([sender isKindOfClass:[UIBarButtonItem class]]){
        [popover presentPopoverFromBarButtonItem:sender
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    }
    
    
}

-(IBAction)addAction:(UIBarButtonItem* )sender{
    
    DetailViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [self showController:vc inPopoverFromSender:sender];
    } else {
        [self showModalController:vc];
    }
    
}

-(IBAction)pressMe:(UIButton* )sender{
    
    DetailViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [self showController:vc inPopoverFromSender:sender];
    } else {
        [self showModalController:vc];
    }
}
#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController{
    self.popover = nil;
    NSLog(@"popover deallocated");
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"prepareForSegue %@", segue.identifier);
}

@end
