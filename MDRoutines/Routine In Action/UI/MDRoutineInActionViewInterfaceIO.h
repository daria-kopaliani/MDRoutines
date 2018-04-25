//
//  MDRoutineInActionViewInterfaceIO.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDViewInterfaceIO.h"


@class MDActiveTaskDisplayData;


typedef NS_ENUM(NSUInteger, MDRoutineInActionViewInterfaceState) {
    
    MDRoutineInActionViewInterfaceStateIdle = 0,
    MDRoutineInActionViewInterfaceStateRunning,
};


NS_ASSUME_NONNULL_BEGIN


@protocol MDRoutineInActionViewInterface <MDViewInterface>

- (void)configureWithCurrentTask:(MDActiveTaskDisplayData *)currentTask;
- (void)configureWithFormattedProgress:(NSString *)formattedProgress percentDone:(float)percentDone;
- (void)configureWithState:(MDRoutineInActionViewInterfaceState)state;

@end


@protocol MDRoutineInActionViewInterfaceDelegate <MDViewInterfaceDelegate>

- (void)routineInActionViewInterfaceDidRequestResume:(id<MDRoutineInActionViewInterface>)viewInterface;
- (void)routineInActionViewInterfaceDidRequestPause:(id<MDRoutineInActionViewInterface>)viewInterface;

@end


NS_ASSUME_NONNULL_END
