//
//  MDRoutineViewController.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineViewController.h"

#import <PureLayout/PureLayout.h>

#import "MDRoutineDisplayData.h"
#import "MDTaskDisplayData.h"
#import "MDTaskTableViewCell.h"

#import "UITableViewCell+Convenience.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) MDRoutineDisplayData *routine;

@property (nonatomic, strong) UITableView *tableView;

@end


@implementation MDRoutineViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableView];
    [self.tableView autoPinEdgesToSuperviewEdges];
    self.tableView.rowHeight = 50.f;
    
    [self.tableView registerNib:[MDTaskTableViewCell defaultNib] forCellReuseIdentifier:[MDTaskTableViewCell defaultReuseIndentifier]];
}

#pragma mark - <MDRoutineViewInterface>

- (void)configureWithRoutine:(MDRoutineDisplayData *)routine {

    NSParameterAssert(routine);
    
    self.routine = routine;
    self.title = routine.title;
    [self.tableView reloadData];
}

#pragma mark - Table View

#pragma mark - <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    switch (indexPath.section) {
        case 0: {
            cell = [tableView dequeueReusableCellWithIdentifier:[MDTaskTableViewCell defaultReuseIndentifier] forIndexPath:indexPath];
        } break;
        default: {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        } break;
    }
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSInteger numberOfRows;
    switch (section) {
        case 0: numberOfRows = self.routine.tasks.count; break;
        case 1: numberOfRows = 1; break;
        default: numberOfRows= 0;
    }
    
    return numberOfRows;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {

    NSString *title = nil;
    if (section == 0) {
        title = self.routine.formattedDuration;
    }
    
    return title;
}

#pragma mark <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 1: {
            [self.delegate routineViewInterfaceDidSelectRoutine:self];
        }
        default: break;
    }
}

#pragma mark - Private

- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    NSParameterAssert(cell);
    NSParameterAssert(indexPath);
    
    switch (indexPath.section) {
        case 0: {
            MDTaskTableViewCell *taskTableViewCell = SAFE_CAST(cell, MDTaskTableViewCell);
            MDTaskDisplayData *task = self.routine.tasks[indexPath.row];
            if (task && taskTableViewCell) {
                [taskTableViewCell configureWithTask:task];
            }
        } break;
        case 1: {
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.text = @"Start";
        } break;
    }
}

@end



NS_ASSUME_NONNULL_END
