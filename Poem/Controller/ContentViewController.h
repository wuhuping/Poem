//
//  ContentViewController.h
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PoemViewController.h"
@class Poem;
@interface ContentViewController : PoemViewController

@property (nonatomic, strong) Poem *poem;
@end
