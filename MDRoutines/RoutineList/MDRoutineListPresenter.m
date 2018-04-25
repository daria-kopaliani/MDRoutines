//
//  MDRoutineListPresenter.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineListPresenter.h"
#import "MDRoutineListWireframe.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineListPresenter ()

@property (nonatomic, strong) id<MDRoutineListInteractor> interacrtor;
@property (nonatomic, strong) MDRoutineListWireframe *wireframe;

@property (nonatomic, strong) NSDictionary<NSString *, MDRoutine *> *routineDisplayDataDictionary;

@end


@implementation MDRoutineListPresenter

- (instancetype)initWithInteractor:(id<MDRoutineListInteractor>)interacrtor
                         wireframe:(MDRoutineListWireframe *)wireframe {
 
    NSParameterAssert(interacrtor);
    
    self = [super init];
    if (self) {
        self.interacrtor = interacrtor;
        self.wireframe = wireframe;
    }
    
    return self;
}

- (void)setViewInterface:(nullable UIViewController<MDRoutineListViewInterface> *)viewInterface {
    
    NSParameterAssert(viewInterface);
    
    _viewInterface = viewInterface;
    NSArray<MDRoutine *> *routines = [self.interacrtor routines];
    NSArray<NSString *> *routineDisplayDataArray = [routines valueForKey:@"title"];
    self.routineDisplayDataDictionary = [NSDictionary dictionaryWithObjects:routines forKeys:routineDisplayDataArray];
    [self.viewInterface configureWithRoutineList:routineDisplayDataArray];
}

#pragma mark - <MDRoutineListViewInterfaceDelegate>

- (void)routineListViewInterface:(id<MDRoutineListViewInterface>)viewInterface didSelectRoutine:(NSString *)routineDisplayData {
    
    MDRoutine *routine = self.routineDisplayDataDictionary[routineDisplayData];
    if (routine) {
        [self.wireframe presentViewInterfaceForRoutine:routine fromViewController:self.viewInterface];
    } else {
    }
}

- (void)routineListViewInterfaceDidRequestNewRoutine:(id<MDRoutineListViewInterface>)viewInterface {
    
}

@end


NS_ASSUME_NONNULL_END
