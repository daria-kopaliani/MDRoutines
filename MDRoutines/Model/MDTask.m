//
//  MDTask.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDTask.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDTask ()

@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) MDTaskType type;

@end


@implementation MDTask

+ (instancetype)breakIdentifier:(NSString *)identifier
                          title:(NSString *)title
                       duration:(NSTimeInterval)duration {
    
    return [[self alloc] initWithIdentifier:identifier
                                      title:title
                                   duration:duration
                                       type:MDTaskTypeBreak];
}

+ (instancetype)exerciseWithIdentifier:(NSString *)identifier
                                 title:(NSString *)title
                              duration:(NSTimeInterval)duration {
    
    return [[self alloc] initWithIdentifier:identifier
                                      title:title
                                   duration:duration
                                       type:MDTaskTypeExercise];
}

- (instancetype)initWithIdentifier:(NSString *)identifier
                             title:(NSString *)title
                          duration:(NSTimeInterval)duration
                              type:(MDTaskType)type {
    
    NSParameterAssert(identifier);
    NSParameterAssert(title);
    
    self = [super initWithDuration:duration];
    if (self) {
        self.identifier = identifier;
        self.title = title;
        self.type = type;
    }
    
    return self;
}

@end


NS_ASSUME_NONNULL_END
