//
//  MDRoutineViewController.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineViewInterfaceIO.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineViewController : UIViewController <MDRoutineViewInterface>

@property (nonatomic, weak) id<MDRoutineViewInterfaceDelegate> delegate;

@end


NS_ASSUME_NONNULL_END
