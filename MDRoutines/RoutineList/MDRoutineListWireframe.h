//
//  MDRoutineListWireframe.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

@class MDRoutine, MDRoutineAssembly;


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineListWireframe : NSObject

@property (nonatomic, strong) MDRoutineAssembly *routineAssembly;

- (void)presentViewInterfaceForRoutine:(MDRoutine *)routine fromViewController:(UIViewController *)viewController;

@end


NS_ASSUME_NONNULL_END
