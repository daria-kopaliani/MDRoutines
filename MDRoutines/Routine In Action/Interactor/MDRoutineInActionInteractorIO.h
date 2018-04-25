//
//  MDRoutineInActionInteractorIO.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

@class MDRoutine, MDTask;
@protocol MDRoutineInActionInteractorDelegate;


typedef NS_ENUM(NSUInteger, MDRoutineInActionInteractorState) {
    
    MDRoutineInActionInteractorStateIdle = 0,
    MDRoutineInActionInteractorStateRunning,
};

NS_ASSUME_NONNULL_BEGIN


@protocol MDRoutineInActionInteractor <NSObject>

@property (nonatomic, weak) id<MDRoutineInActionInteractorDelegate> delegate;

- (MDRoutine *)routine;

- (void)pause;
- (void)resume;

- (MDTask *)currentTask;
- (nullable MDTask *)nextTask;

@end


@protocol MDRoutineInActionInteractorDelegate <NSObject>

- (void)routineInActionInteractor:(id<MDRoutineInActionInteractor>)interactor didUpdateCurrentTask:(MDTask *)currentTask;
- (void)routineInActionInteractor:(id<MDRoutineInActionInteractor>)interactor
                didUpdateProgress:(NSTimeInterval)absoluteProgress
                          forTask:(MDTask *)task;

- (void)routineInActionInteractor:(id<MDRoutineInActionInteractor>)interactor didUpdateState:(MDRoutineInActionInteractorState)state;

@end


NS_ASSUME_NONNULL_END

