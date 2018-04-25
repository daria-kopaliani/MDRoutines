//
//  MDRoutineInActionPresenter.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineInActionPresenter.h"

#import "MDActiveTaskDisplayData.h"
#import "MDRoutine.h"
#import "MDRoutineInActionInteractorIO.h"
#import "MDTask.h"

#import "NSObject+Convenience.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineInActionPresenter ()

@property (nonatomic, strong) id<MDRoutineInActionInteractor> interactor;

@end


@implementation MDRoutineInActionPresenter

- (instancetype)initWithInteractor:(id<MDRoutineInActionInteractor>)interactor {

    NSParameterAssert(interactor);
    
    self = [super init];
    if (self) {
        self.interactor = interactor;
        
        interactor.delegate = self;
    }
    
    return self;
}

#pragma mark - Overwritten Setters

- (void)setViewInterface:(UIViewController<MDRoutineInActionViewInterface> *)viewInterface {
    
    _viewInterface = viewInterface;
}

#pragma mark - <MDRoutineInActionInteractorDelegate>

- (void)routineInActionInteractor:(id<MDRoutineInActionInteractor>)interactor didUpdateCurrentTask:(MDTask *)currentTask {

    [self performBlockOnMainThreadSoftly:^{
        
        if (currentTask) {
            [self.viewInterface configureWithCurrentTask:[self displayDataForTask:currentTask]];
        }
    }];
}

- (void)routineInActionInteractor:(id<MDRoutineInActionInteractor>)interactor didUpdateProgress:(NSTimeInterval)absoluteProgress forTask:(MDTask *)task {
    
    NSParameterAssert(task);
    
    [self configureWithProgress:absoluteProgress forTask:task];
}

- (void)routineInActionInteractor:(id<MDRoutineInActionInteractor>)interactor didUpdateState:(MDRoutineInActionInteractorState)state {
 
    [self performBlockOnMainThreadSoftly:^{
        
        [self.viewInterface configureWithState:[self displayDataForState:state]];
    }];
}

#pragma mark - <MDRoutineInActionViewInterfaceDelegate>

- (void)routineInActionViewInterfaceDidRequestResume:(id<MDRoutineInActionViewInterface>)viewInterface {
   
    [self.interactor resume];
}

- (void)routineInActionViewInterfaceDidRequestPause:(id<MDRoutineInActionViewInterface>)viewInterface {
 
    [self.interactor pause];
}

#pragma mark - <MDRoutineViewInterfaceDelegate>

- (void)viewInterfaceDidLoad:(id<MDViewInterface>)viewInterface {
    
    self.viewInterface.title = self.interactor.routine.title;
    [self.viewInterface configureWithCurrentTask:[self displayDataForTask:[self.interactor currentTask]]];
    [self configureWithProgress:0 forTask:[self.interactor currentTask]];
}

#pragma mark - Private

- (void)configureWithProgress:(NSTimeInterval)absoluteProgress forTask:(MDTask *)task {
    
    static NSDateComponentsFormatter *MDRoutineInActionPresenterDurationFormatter;
    if (!MDRoutineInActionPresenterDurationFormatter) {
        MDRoutineInActionPresenterDurationFormatter = [[NSDateComponentsFormatter alloc] init];
        MDRoutineInActionPresenterDurationFormatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
        MDRoutineInActionPresenterDurationFormatter.allowedUnits = (NSCalendarUnitMinute | NSCalendarUnitSecond);
    }
    
    NSString *formattedDuration = [MDRoutineInActionPresenterDurationFormatter stringFromTimeInterval:task.duration - absoluteProgress];
    [self performBlockOnMainThreadSoftly:^{
        
        [self.viewInterface configureWithFormattedProgress:formattedDuration
                                               percentDone:100 * (absoluteProgress / task.duration)];
    }];
}

- (MDRoutineInActionViewInterfaceState)displayDataForState:(MDRoutineInActionInteractorState)state {
    
    MDRoutineInActionViewInterfaceState displayData;
    switch (state) {
        case MDRoutineInActionInteractorStateIdle: displayData = MDRoutineInActionViewInterfaceStateIdle; break;
        case MDRoutineInActionInteractorStateRunning: displayData = MDRoutineInActionViewInterfaceStateRunning; break;
    }
    
    return displayData;
}

- (MDActiveTaskDisplayData *)displayDataForTask:(MDTask *)task {

    NSString *subtitle = (task.type == MDTaskTypeBreak) ? subtitle = [self.interactor nextTask].title : @"";
    return [MDActiveTaskDisplayData displayDataWithTitle:task.title
                                                subtitle:subtitle
                                                   color:[UIColor redColor]
                                                duration:task.duration];
}

@end


NS_ASSUME_NONNULL_END
