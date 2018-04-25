//
//  MDRoutineInActionViewController.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineInActionViewController.h"

#import <PureLayout/PureLayout.h>

#import "MDActiveTaskDisplayData.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineInActionViewController ()

@property (nonatomic, strong) MDActiveTaskDisplayData *currentTask;

@property (nonatomic, strong) UIView *progressOverlayView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIButton *togglePlayPauseButton;
@property (nonatomic, strong) NSLayoutConstraint *constraint;

@end


@implementation MDRoutineInActionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.progressOverlayView = [UIView newAutoLayoutView];
//    [self.view addSubview:self.progressOverlayView];
//    [self.progressOverlayView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
//    [self.progressOverlayView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
//    [self.progressOverlayView autoPinEdgeToSuperviewEdge:ALEdgeRight];
//    self.constraint = [self.progressOverlayView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:64.f];
    
    self.containerView = [UIView newAutoLayoutView];
//    self.containerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.containerView];
    [self.containerView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.view withOffset:-64.f];
    [self.containerView autoAlignAxisToSuperviewAxis:ALAxisVertical];
//    [self.containerView autoCenterInSuperview];
    
    self.titleLabel = [UILabel newAutoLayoutView];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:30.f weight:UIFontWeightMedium];
    self.titleLabel.numberOfLines = 0;
    [self.containerView addSubview:self.titleLabel];
    [self.titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.containerView];
    [self.titleLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.containerView];
    [self.titleLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.7f];
//    self.titleLabel.backgroundColor = [UIColor grayColor];

    self.progressLabel = [UILabel newAutoLayoutView];
    [self.progressLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    self.progressLabel.font = [UIFont systemFontOfSize:46.f weight:UIFontWeightThin];
    [self.containerView addSubview:self.progressLabel];
    [self.progressLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:50.f];
//    [self.progressLabel autoPinEdgesToSuperviewMarginsExcludingEdge:ALEdgeTop];
    [self.progressLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withMultiplier:0.7f];
    [self.progressLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:self.containerView];
    [self.progressLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.containerView];
//    self.progressLabel.backgroundColor = [UIColor brownColor];
    
    self.togglePlayPauseButton = [UIButton newAutoLayoutView];
    [self.view addSubview:self.togglePlayPauseButton];
    [self.togglePlayPauseButton setImage:[UIImage imageNamed:@"Play"] forState:UIControlStateNormal];
    [self.togglePlayPauseButton setImage:[UIImage imageNamed:@"Pause"] forState:UIControlStateSelected];
    [self.togglePlayPauseButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.togglePlayPauseButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.containerView withOffset:60.f];
    [self.togglePlayPauseButton addTarget:self action:@selector(togglePlayPause) forControlEvents:UIControlEventTouchUpInside];

    self.subtitleLabel = [UILabel newAutoLayoutView];
    self.subtitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.subtitleLabel];
    [self.subtitleLabel autoPinEdgeToSuperviewMargin:ALEdgeLeft];
    [self.subtitleLabel autoPinEdgeToSuperviewMargin:ALEdgeRight];
    [self.subtitleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:30.f];
    self.subtitleLabel.font = [UIFont systemFontOfSize:20.f weight:UIFontWeightLight];
    self.subtitleLabel.numberOfLines = 0;
    
    [self.delegate viewInterfaceDidLoad:self];
}

#pragma mark - <MDRoutineInActionViewInterface>

- (void)configureWithCurrentTask:(MDActiveTaskDisplayData *)currentTask {

    self.currentTask = currentTask;
    self.titleLabel.text = currentTask.title;
    self.subtitleLabel.text = currentTask.subtitle;
    self.progressOverlayView.backgroundColor = currentTask.color;
    self.constraint.constant = 64.f;
    [self.view layoutIfNeeded];
}

- (void)animateProgressForTask:(MDActiveTaskDisplayData *)currentTask {

//    [UIView animateWithDuration:currentTask.duration animations:^{
//
//        self.constraint.constant = CGRectGetHeight(self.view.frame);
//        [self.view layoutIfNeeded];
//    }];
}

- (void)configureWithFormattedProgress:(NSString *)formattedProgress percentDone:(float)percentDone {
    
    self.progressLabel.text = formattedProgress;
}

- (void)configureWithState:(MDRoutineInActionViewInterfaceState)state {
 
    self.togglePlayPauseButton.selected = (state == MDRoutineInActionViewInterfaceStateRunning);
    if (state == MDRoutineInActionViewInterfaceStateIdle) {
        [self.progressOverlayView.layer removeAllAnimations];
    } else {
        [self animateProgressForTask:self.currentTask];
    }
}

#pragma mark - Private

- (void)togglePlayPause {
    
    self.togglePlayPauseButton.selected = !self.togglePlayPauseButton.selected;
    if (self.togglePlayPauseButton.selected) {
        [self.delegate routineInActionViewInterfaceDidRequestResume:self];
    } else {
        [self.delegate routineInActionViewInterfaceDidRequestPause:self];
    }
}

@end


NS_ASSUME_NONNULL_END
