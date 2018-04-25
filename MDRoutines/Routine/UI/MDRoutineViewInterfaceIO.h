//
//  MDRoutineViewInterfaceIO.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

@class MDRoutineDisplayData;


NS_ASSUME_NONNULL_BEGIN


@protocol MDRoutineViewInterface <NSObject>

- (void)configureWithRoutine:(MDRoutineDisplayData *)routine;

@end


@protocol MDRoutineViewInterfaceDelegate <NSObject>

- (void)routineViewInterfaceDidSelectRoutine:(id<MDRoutineViewInterface>)viewInterface;

@end


NS_ASSUME_NONNULL_END

