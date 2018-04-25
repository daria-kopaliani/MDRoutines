//
//  MDRoutineWireframe.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineWireframe.h"

#import "MDRoutineInActionAssembly.h"


NS_ASSUME_NONNULL_BEGIN


@implementation MDRoutineWireframe

- (void)presentActionViewInterfaceForRoutine:(MDRoutine *)routine fromViewController:(UIViewController *)viewController {
    
    NSParameterAssert(routine);
    NSParameterAssert(viewController);
    NSAssert([NSThread isMainThread], @"should be invoked on the main thread");

    NSAssert(self.routineInActionAssembly, @"'routineInActionAssembly' is nil");
    [self.routineInActionAssembly presentViewInterfaceForRoutine:routine inViewController:viewController];
}

@end


NS_ASSUME_NONNULL_END
