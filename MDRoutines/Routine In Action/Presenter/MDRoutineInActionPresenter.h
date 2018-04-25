//
//  MDRoutineInActionPresenter.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineInActionInteractorIO.h"
#import "MDRoutineInActionViewInterfaceIO.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineInActionPresenter : NSObject <MDRoutineInActionInteractorDelegate, MDRoutineInActionViewInterfaceDelegate>

@property (nonatomic, strong) UIViewController<MDRoutineInActionViewInterface> *viewInterface;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithInteractor:(id<MDRoutineInActionInteractor>)interactor NS_DESIGNATED_INITIALIZER;

@end


NS_ASSUME_NONNULL_END
