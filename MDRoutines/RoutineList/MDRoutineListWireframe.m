//
//  MDRoutineListWireframe.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineListWireframe.h"

#import "MDRoutineAssembly.h"


NS_ASSUME_NONNULL_BEGIN


@implementation MDRoutineListWireframe

- (void)presentViewInterfaceForRoutine:(MDRoutine *)routine fromViewController:(UIViewController *)viewController {
    
    NSParameterAssert(self.routineAssembly);
    [self.routineAssembly presentViewInterfaceForRoutine:routine inViewController:viewController];
}

@end


NS_ASSUME_NONNULL_END
