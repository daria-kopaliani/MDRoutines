//
//  MDRoutine.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutine.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutine ()

@property (nonatomic, copy) NSString *identifier;

@end


@implementation MDRoutine

- (instancetype)initWithIdentifier:(NSString *)identifier {
    
    NSParameterAssert(identifier);
    
    self = [super init];
    if (self) {
        self.identifier = identifier;
    }
    
    return self;
}

@end


NS_ASSUME_NONNULL_END
