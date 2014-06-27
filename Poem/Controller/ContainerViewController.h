//
//  ContainerViewController.h
//  Poem
//
//  Created by wuhuping on 14-6-24.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PoemViewController.h"
@interface ContainerViewController : PoemViewController

- (void)transitionFromViewController:(UIViewController *)fromViewController
                    toViewController:(UIViewController *)toViewController;
@end
