//
//  ContentViewController.m
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "ContentViewController.h"
#import "PoemService.h"
#import "Poem.h"
#import "ContainerViewController.h"
#import "MenuViewController.h"
@interface ContentViewController ()
{
    __weak IBOutlet UIScrollView *_scrollView;
    __weak IBOutlet UIImageView *_backgroundImageView;

}
@end

@implementation ContentViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self randomBackgroundImage];
    [self fetchData];
}

- (void)randomBackgroundImage
{
    NSArray *imageArray = @[@"chrysanthemum_bg.png",@"Bamboo_bg.png",@"orchid_bg.png",@"pium2_bg.png",@"plum1_bg.png"];
    int randomIndex = rand()%imageArray.count;
    _backgroundImageView.image = [UIImage imageNamed:imageArray[randomIndex]];
}

- (void)fetchData
{
    PoemService *service = [[PoemService alloc] init];
    [service fetchPoemContentBypoem:self.poem
                           response:^(BOOL isSuccess, id responseObject) {
                               if (isSuccess) {
                                   [self layoutSubViewWithPoem:responseObject];
                               }
                           }];
}

- (IBAction)backButtonPressed:(id)sender {
    MenuViewController *menuViewController = nil;
    ContainerViewController *containerViewController = (ContainerViewController*)self.parentViewController;
    for (UIViewController *controller in containerViewController.childViewControllers) {
        if ([controller isKindOfClass:[MenuViewController class]]) {
            menuViewController = (MenuViewController*)controller;
        }
    }
    [containerViewController transitionFromViewController:self toViewController:menuViewController];
}

- (void)layoutSubViewWithPoem:(Poem*)poem
{
    for (UIView *subView in _scrollView.subviews) {
        [subView removeFromSuperview];
    }
    
    CGFloat originY = 40.0;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0, originY, kWinSize.width, 50);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont boldSystemFontOfSize:24.0];
    titleLabel.text = poem.poemTitle;
    [_scrollView addSubview:titleLabel];
    originY = originY + 50 + 20;
    
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.frame = CGRectMake(0, originY, kWinSize.width, 30);
    authorLabel.textAlignment = NSTextAlignmentCenter;
    authorLabel.font = [UIFont systemFontOfSize:17.0];
    authorLabel.text = poem.poemAuthor;
    [_scrollView addSubview:authorLabel];
    originY = originY + 30 + 20;
    
    NSArray *poemLines = [poem.poemContent componentsSeparatedByString:@"<br />"];
    NSUInteger count = poemLines.count;
    for (int i = 0; i < count; i ++) {
        UILabel *poemLabel = [[UILabel alloc] init];
        poemLabel.frame = CGRectMake(0, originY, kWinSize.width, 30);
        poemLabel.textAlignment = NSTextAlignmentCenter;
        poemLabel.font = [UIFont systemFontOfSize:20.0];
        poemLabel.text = poemLines[i];
        [_scrollView addSubview:poemLabel];
        originY = originY + 40;
    }
    
    _scrollView.contentSize = CGSizeMake(kWinSize.width, originY);
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
