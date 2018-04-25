//
//  MDAssembly.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDAssembly.h"

#import "MDRoutineListAssembly.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDAssembly ()

@property (nonatomic, strong) MDRoutineListAssembly *routineListAssembly;
@end



@implementation MDAssembly

- (void)setUpWithRootViewController:(UIViewController *)rootViewController {

    self.routineListAssembly = [MDRoutineListAssembly new];
    [self.routineListAssembly installInViewController:rootViewController];
}

@end


NS_ASSUME_NONNULL_END
