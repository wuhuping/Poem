//
//  ContainerViewController.m
//  Poem
//
//  Created by wuhuping on 14-6-24.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)transitionFromViewController:(UIViewController *)fromViewController
                    toViewController:(UIViewController *)toViewController
{
    toViewController.view.alpha = 0.0f;
    [self transitionFromViewController:fromViewController
                      toViewController:toViewController
                              duration:0.8f
                               options:UIViewAnimationOptionCurveEaseInOut
                            animations:^{
                                toViewController.view.alpha = 1.0f;
                                fromViewController.view.alpha = 0.0f;
                            } completion:^(BOOL finished) {
                            
                            }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
