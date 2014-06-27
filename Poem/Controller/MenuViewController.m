//
//  MenuViewController.m
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuTableViewCell.h"
#import "AppDelegate.h"
#import "PoemService.h"
#import "Poem.h"
#import "ContentViewController.h"
#import "ContainerViewController.h"
@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>
{
    __weak IBOutlet UITableView *_menuTableView;
    NSArray *_poemMenuArray;
}
@end

@implementation MenuViewController

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
    
    _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _menuTableView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    
    [self fetchData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchData
{
    PoemService *poemService = [[PoemService alloc] init];
    [poemService fetchPoemMenu:^(BOOL isSuccess, id responseObject) {
        if (isSuccess) {
            _poemMenuArray = responseObject;
            [_menuTableView reloadData];
        }
    }];
}

#pragma mark -
#pragma mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _poemMenuArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell" forIndexPath:indexPath];
    Poem *poem = _poemMenuArray[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20.0];
    cell.textLabel.text = poem.poemTitle;
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Poem *poem = _poemMenuArray[indexPath.row];
    
    ContentViewController *contentViewController = nil;
    ContainerViewController *containerViewController = (ContainerViewController*)self.parentViewController;
    for (UIViewController *controller in containerViewController.childViewControllers) {
        if ([controller isKindOfClass:[ContentViewController class]]) {
            contentViewController = (ContentViewController*)controller;
        }
    }
    contentViewController.poem = poem;
    [containerViewController transitionFromViewController:self toViewController:contentViewController];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
