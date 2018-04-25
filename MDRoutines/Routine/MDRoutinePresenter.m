//
//  MDRoutinePresenter.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutinePresenter.h"

#import "MDRoutine.h"
#import "MDRoutineDisplayData.h"
#import "MDRoutineWireframe.h"
#import "MDTask.h"
#import "MDTaskDisplayData.h"

#import "NSArray+Convenience.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutinePresenter ()

@property (nonatomic, strong) MDRoutine *routine;
@property (nonatomic, strong) MDRoutineDisplayData *routineDisplayData;

@end


@implementation MDRoutinePresenter

- (instancetype)initWithRoutine:(MDRoutine *)routine {
    
    NSParameterAssert(routine);
    
    self = [super init];
    if (self) {
        self.routine = routine;
        self.routineDisplayData = [self displayDataForRoutine:routine];
    }
    
    return self;
}

#pragma mark - Overwritten setters

- (void)setViewInterface:(nullable UIViewController<MDRoutineViewInterface> *)viewInterface {
    
    NSAssert([NSThread isMainThread], @"should be invoked on the main thread");
    
    _viewInterface = viewInterface;
    
    [viewInterface configureWithRoutine:self.routineDisplayData];
}

#pragma mark - <MDRoutineViewInterfaceDelegate>

- (void)routineViewInterfaceDidSelectRoutine:(id<MDRoutineViewInterface>)viewInterface {

    NSAssert(self.wireframe, @"'wireframe' is nil");
    [self.wireframe presentActionViewInterfaceForRoutine:self.routine fromViewController:self.viewInterface];
}

#pragma mark - Private

- (MDRoutineDisplayData *)displayDataForRoutine:(MDRoutine *)routine {
    
    NSAssert(routine, @"'routine' is nil");
    
    static NSDateComponentsFormatter *MDRoutinePresenterRoutineDurationFormatter;
    MDRoutinePresenterRoutineDurationFormatter = [[NSDateComponentsFormatter alloc] init];
    
    static NSDateComponentsFormatter *MDRoutinePresenterTaskDurationFormatter;
    if (!MDRoutinePresenterTaskDurationFormatter) {
        MDRoutinePresenterTaskDurationFormatter = [[NSDateComponentsFormatter alloc] init];
        MDRoutinePresenterTaskDurationFormatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
        MDRoutinePresenterTaskDurationFormatter.allowedUnits = (NSCalendarUnitMinute | NSCalendarUnitSecond);
    }
    
    __block NSTimeInterval routineDuration = 0;
    NSArray<MDTaskDisplayData *> *taskDisplayDataArray = [routine.tasks arrayFromObjectsCollectedWithBlock:^id _Nullable(MDTask *aTask) {
        
        MDTaskDisplayData *taskDisplayData;
        if (aTask.type == MDTaskTypeExercise) {
            taskDisplayData = [MDTaskDisplayData displayDataWithTitle:aTask.title
                                                    formattedDuration:[MDRoutinePresenterTaskDurationFormatter stringFromTimeInterval:aTask.duration]];
            routineDuration += aTask.duration;
        }
        
        return taskDisplayData;
    }];
    NSString *formattedRoutineDuration = [NSString stringWithFormat:@"Total duration: %@", [MDRoutinePresenterRoutineDurationFormatter stringFromTimeInterval:routineDuration]];
    
    return [MDRoutineDisplayData displayDataWithTitle:routine.title
                                                tasks:taskDisplayDataArray
                                    formattedDuration:formattedRoutineDuration];
}

@end


NS_ASSUME_NONNULL_END
