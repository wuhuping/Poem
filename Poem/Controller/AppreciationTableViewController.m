//
//  AppreciationTableViewController.m
//  Poem
//
//  Created by wuhuping on 14-6-30.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#import "AppreciationTableViewController.h"
#import "Poem.h"
#import "AppreciationCell.h"
static NSString *AppreciationCellIdentifier = @"AppreciationCell";

@interface AppreciationTableViewController ()

@property (nonatomic, strong) NSMutableArray *commentArray;
@property (strong, nonatomic) NSMutableDictionary *offscreenCells;
@end


@implementation AppreciationTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshControllValueChanged) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView registerClass:[AppreciationCell class] forCellReuseIdentifier:AppreciationCellIdentifier];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

    self.title = @"赏析";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshControllValueChanged
{
    [self performSelector:@selector(handleData) withObject:nil afterDelay:2];
}

- (void)handleData
{
    [self.refreshControl endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    }else {
        return self.commentArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.0f;
    }else {
        return 20.0f;
    }
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }else {
        __autoreleasing UIView *headerSectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWinSize.width, 20)];
        headerSectionView.backgroundColor = [UIColor colorWithRed:23/255.0 green:79/255.0 blue:121/255.0 alpha:1.0];
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, kWinSize.width - 35, 20)];
        titleLable.backgroundColor = [UIColor clearColor];
        titleLable.font = [UIFont boldSystemFontOfSize:15.0];
        titleLable.textColor = [UIColor whiteColor];
        titleLable.text = @"最新评论";
        [headerSectionView addSubview:titleLable];
        
        return headerSectionView;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        AppreciationCell *cell = [tableView dequeueReusableCellWithIdentifier:AppreciationCellIdentifier];
        cell.bodyLabel.text = self.poem.poemAppreciation;
        
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
        return cell;
    }else {
        UITableViewCell *cell;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        AppreciationCell *cell = [self.offscreenCells objectForKey:AppreciationCellIdentifier];
        if (cell == nil) {
            cell = [[AppreciationCell alloc] init];
            [self.offscreenCells setObject:cell forKey:AppreciationCellIdentifier];
        }
        
        cell.bodyLabel.text = self.poem.poemAppreciation;
        
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
        
        cell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.bounds), CGRectGetHeight(cell.bounds));
        
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
        
        CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
        
        height += 1;
        
        return height;
    }else {
        return 44.0;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
