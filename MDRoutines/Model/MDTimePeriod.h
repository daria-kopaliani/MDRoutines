//
//  MDTimePeriod.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN


@interface MDTimePeriod : NSObject

@property (nonatomic, assign, readonly) NSTimeInterval duration;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithDuration:(NSTimeInterval)duration NS_DESIGNATED_INITIALIZER;

@end


NS_ASSUME_NONNULL_END
