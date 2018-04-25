//
//  MDRoutineInActionAssembly.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineInActionAssembly.h"

#import "MDRoutineInActionInteractor.h"
#import "MDRoutineInActionPresenter.h"
#import "MDRoutineInActionViewController.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineInActionAssembly ()

@property (nonatomic, strong) MDRoutineInActionPresenter *presenter;

@end


@implementation MDRoutineInActionAssembly

- (void)presentViewInterfaceForRoutine:(MDRoutine *)routine inViewController:(UIViewController *)containerViewController {

    NSParameterAssert(routine);
    NSParameterAssert(containerViewController);
    
    NSAssert([NSThread isMainThread], @"should be invoked on the main thread");
    
    MDRoutineInActionInteractor *interactor = [[MDRoutineInActionInteractor alloc] initWithRoutine:routine];
    MDRoutineInActionPresenter *presenter = [[MDRoutineInActionPresenter alloc] initWithInteractor:interactor];
    MDRoutineInActionViewController *viewController = [MDRoutineInActionViewController new];
    presenter.viewInterface = viewController;
    viewController.delegate = presenter;
    
    self.presenter = presenter;
    
    [containerViewController.navigationController pushViewController:viewController animated:YES];
}

@end


NS_ASSUME_NONNULL_END
