//
//  MDRoutineAssembly.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineAssembly.h"

#import "MDRoutineInActionAssembly.h"
#import "MDRoutinePresenter.h"
#import "MDRoutineViewController.h"
#import "MDRoutineWireframe.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineAssembly ()

@property (nonatomic, strong) MDRoutinePresenter *presenter;

@end


@implementation MDRoutineAssembly

- (void)presentViewInterfaceForRoutine:(MDRoutine *)routine inViewController:(UIViewController *)containerViewController {
 
    NSParameterAssert(routine);
    NSParameterAssert(containerViewController);
    
    NSAssert([NSThread isMainThread], @"should be invoked on the main thread");
    
    MDRoutinePresenter *presenter = [[MDRoutinePresenter alloc] initWithRoutine:routine];
    MDRoutineViewController *viewInterface = [MDRoutineViewController new];
    MDRoutineWireframe *wireframe = [MDRoutineWireframe new];
    wireframe.routineInActionAssembly = [MDRoutineInActionAssembly new];
    presenter.wireframe = wireframe;
    presenter.viewInterface = viewInterface;
    viewInterface.delegate = presenter;
    
    self.presenter = presenter;
    [containerViewController.navigationController pushViewController:viewInterface animated:YES];
}

@end


NS_ASSUME_NONNULL_END
