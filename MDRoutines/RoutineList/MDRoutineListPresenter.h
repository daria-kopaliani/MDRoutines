//
//  MDRoutineListPresenter.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineListInteractorIO.h"
#import "MDRoutineListViewInterfaceIO.h"
#import "MDRoutineListWireframe.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineListPresenter : NSObject <MDRoutineListViewInterfaceDelegate>

@property (nonatomic, weak) UIViewController<MDRoutineListViewInterface> *viewInterface;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithInteractor:(id<MDRoutineListInteractor>)interacrtor
                         wireframe:(MDRoutineListWireframe *)wireframe NS_DESIGNATED_INITIALIZER;

@end


NS_ASSUME_NONNULL_END
