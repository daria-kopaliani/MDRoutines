//
//  MDRoutineInActionAssembly.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

@class MDRoutine;


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineInActionAssembly : NSObject

- (void)presentViewInterfaceForRoutine:(MDRoutine *)routine inViewController:(UIViewController *)viewController;

@end


NS_ASSUME_NONNULL_END
