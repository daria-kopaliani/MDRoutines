//
//  NSObject+Convenince.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "NSObject+Convenience.h"


NS_ASSUME_NONNULL_BEGIN


@implementation NSObject (Convenience)

+ (void)performBlockOnMainThreadSoftly:(void (^)(void))block {
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

+ (void)performBlockOnMainThreadSynchronously:(void (^)(void))block {
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

- (void)performBlockOnMainThreadSoftly:(void (^)(void))block {
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

- (void)performBlockOnMainThreadSynchronously:(void (^)(void))block {
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

@end


NS_ASSUME_NONNULL_END
