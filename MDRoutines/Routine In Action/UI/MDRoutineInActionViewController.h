//
//  MDRoutineInActionViewController.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineInActionViewInterfaceIO.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineInActionViewController : UIViewController <MDRoutineInActionViewInterface>

@property (nonatomic, weak) id<MDRoutineInActionViewInterfaceDelegate> delegate;

@end


NS_ASSUME_NONNULL_END
