//
//  MDRoutineListInteractorIO.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

@class MDRoutine;


NS_ASSUME_NONNULL_BEGIN


@protocol MDRoutineListInteractor <NSObject>

- (NSArray<MDRoutine *> *)routines;

@end


NS_ASSUME_NONNULL_END

