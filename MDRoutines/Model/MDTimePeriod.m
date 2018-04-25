//
//  MDTimePeriod.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDTimePeriod.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDTimePeriod ()

@property (nonatomic, assign) NSTimeInterval duration;

@end


@implementation MDTimePeriod

- (instancetype)initWithDuration:(NSTimeInterval)duration {
    
    self = [super init];
    if (self) {
        self.duration = duration;
    }
    
    return self;
}

@end


NS_ASSUME_NONNULL_END
