//
//  MDRoutineListViewInterface.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN


@protocol MDRoutineListViewInterface <NSObject>

- (void)configureWithRoutineList:(NSArray<NSString *> *)routineList;

@end


@protocol MDRoutineListViewInterfaceDelegate <NSObject>

- (void)routineListViewInterface:(id<MDRoutineListViewInterface>)viewInterface didSelectRoutine:(NSString *)routine;
- (void)routineListViewInterfaceDidRequestNewRoutine:(id<MDRoutineListViewInterface>)viewInterface;

@end


NS_ASSUME_NONNULL_END
