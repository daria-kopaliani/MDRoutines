//
//  MDRoutineListViewController.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineListViewController.h"

#import <PureLayout/PureLayout.h>


static NSString *const MDRoutineListViewControllerCellReuseIdentifier = @"MDRoutineListViewControllerCellReuseIdentifier";


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *routineList;

@end


@implementation MDRoutineListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    [self.tableView autoPinEdgesToSuperviewEdges];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:MDRoutineListViewControllerCellReuseIdentifier];
}

- (void)configureWithRoutineList:(NSArray<NSString *> *)routineList {

    self.routineList = routineList;
    [self.tableView reloadData];
}

#pragma mark - Table View

#pragma mark - <UITableViewDataSource>

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MDRoutineListViewControllerCellReuseIdentifier forIndexPath:indexPath];
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.routineList.count;
}

#pragma mark <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *routine = self.routineList[indexPath.row];
    [self.delegate routineListViewInterface:self didSelectRoutine:routine];
}

#pragma mark - Private

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    NSParameterAssert(cell);
    NSParameterAssert(indexPath);
    
    cell.textLabel.text = self.routineList[indexPath.row];
}

@end


NS_ASSUME_NONNULL_END
