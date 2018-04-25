//
//  MDRoutineListAssembly.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineListAssembly.h"

#import "MDRoutineAssembly.h"
#import "MDRoutineListInteractor.h"
#import "MDRoutineListPresenter.h"
#import "MDRoutineListViewController.h"
#import "MDRoutineListWireframe.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineListAssembly ()

@property (nonatomic, strong) MDRoutineListPresenter *presenter;
@property (nonatomic, strong) MDRoutineListWireframe *wireframe;

@end


@implementation MDRoutineListAssembly

- (void)installInViewController:(UIViewController *)containerViewController {
    
    NSParameterAssert(containerViewController);
    NSAssert([NSThread isMainThread], @"should be invoked on the main thread");
    
    MDRoutineListViewController *viewController = [MDRoutineListViewController new];
    MDRoutineListInteractor *interactor = [MDRoutineListInteractor new];
    MDRoutineListWireframe *wireframe = [MDRoutineListWireframe new];
    wireframe.routineAssembly = [MDRoutineAssembly new];
    MDRoutineListPresenter *presenter = [[MDRoutineListPresenter alloc] initWithInteractor:interactor wireframe:wireframe];
    presenter.viewInterface = viewController;
    viewController.delegate = presenter;
    
    self.presenter = presenter;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [containerViewController addChildViewController:navigationController];
    [navigationController willMoveToParentViewController:containerViewController];
    [containerViewController.view addSubview:navigationController.view];
    navigationController.view.frame = containerViewController.view.bounds;
    [navigationController didMoveToParentViewController:containerViewController];
    
}

@end


NS_ASSUME_NONNULL_END
