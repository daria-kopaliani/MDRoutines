//
//  NSObject+Convenince.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN


@interface NSObject (Convenience)

+ (void)performBlockOnMainThreadSoftly:(void (^)(void))block;
+ (void)performBlockOnMainThreadSynchronously:(void (^)(void))block;
- (void)performBlockOnMainThreadSoftly:(void (^)(void))block;
- (void)performBlockOnMainThreadSynchronously:(void (^)(void))block;

@end


NS_ASSUME_NONNULL_END

