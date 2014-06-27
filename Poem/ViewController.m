//
//  ViewController.m
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "ViewController.h"
#import "PoemViewController.h"
#import "PoemNavigationController.h"
#import "MenuViewController.h"
#import "ContentViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
{
    PoemNavigationController    *_navigationController;
    MenuViewController          *_menuViewController;
    ContentViewController       *_contentViewController;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self configSubView];
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    appDelegate.viewController = self;
}

- (void)configSubView
{
    _navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"PoemNavigationController"];
    self.containerViewController = _navigationController.viewControllers[0];
    [self.view addSubview:_navigationController.view];
    
    _menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
    [self.containerViewController addChildViewController:_menuViewController];
    [self.containerViewController.view addSubview:_menuViewController.view];
    
    _contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
    [self.containerViewController addChildViewController:_contentViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
