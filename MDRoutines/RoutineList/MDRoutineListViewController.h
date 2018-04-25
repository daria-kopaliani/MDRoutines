//
//  MDRoutineListViewController.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineListViewInterfaceIO.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineListViewController : UIViewController <MDRoutineListViewInterface>

@property (nonatomic, weak) id<MDRoutineListViewInterfaceDelegate> delegate;

@end


NS_ASSUME_NONNULL_END
