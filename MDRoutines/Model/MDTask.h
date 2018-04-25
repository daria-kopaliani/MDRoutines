//
//  MDTask.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDTimePeriod.h"


typedef NS_ENUM(NSUInteger, MDTaskType) {
    
    MDTaskTypeBreak = 0,
    MDTaskTypeExercise,
};

NS_ASSUME_NONNULL_BEGIN


@interface MDTask : MDTimePeriod

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, assign, readonly) MDTaskType type;

+ (instancetype)new NS_UNAVAILABLE;
+ (instancetype)breakIdentifier:(NSString *)identifier
                          title:(NSString *)title
                       duration:(NSTimeInterval)duration;
+ (instancetype)exerciseWithIdentifier:(NSString *)identifier
                                 title:(NSString *)title
                              duration:(NSTimeInterval)duration;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithIdentifier:(NSString *)identifier
                             title:(NSString *)title
                          duration:(NSTimeInterval)duration
                              type:(MDTaskType)type;
@end


NS_ASSUME_NONNULL_END
