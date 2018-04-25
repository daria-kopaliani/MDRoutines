//
//  MDRoutineInActionInteractor.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineInActionInteractorIO.h"


@class MDRoutine;


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineInActionInteractor : NSObject <MDRoutineInActionInteractor>

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithRoutine:(MDRoutine *)routine NS_DESIGNATED_INITIALIZER;

@end


NS_ASSUME_NONNULL_END
