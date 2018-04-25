//
//  MDRoutineInActionInteractor.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineInActionInteractor.h"

#import <AudioToolbox/AudioToolbox.h>

#import "MDRoutine.h"
#import "MDTask.h"

#import "NSObject+Convenience.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineInActionInteractor ()

@property (nonatomic, strong) MDRoutine *routine;
@property (nonatomic, assign) NSUInteger currentTaskIndex;
@property (nonatomic, assign) MDRoutineInActionInteractorState state;

@property (nonatomic, strong, nullable) NSTimer *timer;
@property (nonatomic, strong, nullable) NSNumber *timeInterval;

@end


@implementation MDRoutineInActionInteractor

@synthesize delegate;

- (instancetype)initWithRoutine:(MDRoutine *)routine {
    
    NSParameterAssert(routine);
    
    self = [super init];
    if (self) {
        self.routine = routine;
        self.timeInterval = @0;
    }
    
    return self;
}

#pragma mark - <MDRoutineInActionInteractor>

- (void)pause {
    
    self.state = MDRoutineInActionInteractorStateIdle;
    [self.timer invalidate];
    self.timer = nil;
    [self performBlockOnMainThreadSoftly:^{
        
        [self.delegate routineInActionInteractor:self didUpdateState:self.state];
    }];
}

- (void)resume {

    self.state = MDRoutineInActionInteractorStateRunning;
    [self.timer invalidate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
      
        MDTask *task = [self currentTask];
        NSInteger progress = [self.timeInterval integerValue];
        progress += 1;
        self.timeInterval = @(progress);
        [self.delegate routineInActionInteractor:self didUpdateProgress:progress forTask:task];
        
        if (task.duration - progress <= 3) {
            switch (task.type) {
                case MDTaskTypeExercise: {
                    AudioServicesPlaySystemSound(1050);
                } break;
                case MDTaskTypeBreak: {
                    if (task.duration - progress == 1) {
                        AudioServicesPlaySystemSound(1009);
                        
                    }
                } break;
            }
        }
        if (progress >= task.duration) {
            if (self.currentTaskIndex + 1 < self.routine.tasks.count) {
                self.currentTaskIndex++;
                self.timeInterval = @(0);
                MDTask *updatedTask = [self currentTask];
                [self.delegate routineInActionInteractor:self didUpdateCurrentTask:updatedTask];
                [self.delegate routineInActionInteractor:self didUpdateProgress:0 forTask:updatedTask];
                [self resume];
            } else {
                [self.timer invalidate];
                self.timer = nil;
            }
        }
    }];
    [self performBlockOnMainThreadSoftly:^{
        
        [self.delegate routineInActionInteractor:self didUpdateState:self.state];
    }];
}

- (MDTask *)currentTask {
    
    return self.routine.tasks[self.currentTaskIndex];
}

- (nullable MDTask *)nextTask {
    
    return (self.currentTaskIndex + 1 < self.routine.tasks.count) ? self.routine.tasks[self.currentTaskIndex + 1] : nil;
}

@end


NS_ASSUME_NONNULL_END
