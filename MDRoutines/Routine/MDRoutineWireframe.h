//
//  MDRoutineWireframe.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

@class MDRoutine, MDRoutineInActionAssembly;


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineWireframe : NSObject

@property (nonatomic, strong) MDRoutineInActionAssembly *routineInActionAssembly;

- (void)presentActionViewInterfaceForRoutine:(MDRoutine *)routine fromViewController:(UIViewController *)viewController;

@end


NS_ASSUME_NONNULL_END
