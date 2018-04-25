//
//  MDTaskDisplayData.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDTaskDisplayData.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDTaskDisplayData ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *formattedDuration;

@end


@implementation MDTaskDisplayData

+ (instancetype)displayDataWithTitle:(NSString *)title formattedDuration:(NSString *)formattedDuration {
    
    return [[self alloc] initWithTitle:title formattedDuration:formattedDuration];
}

- (instancetype)initWithTitle:(NSString *)title formattedDuration:(NSString *)formattedDuration {
 
    NSParameterAssert(title);
    NSParameterAssert(formattedDuration);
    
    self = [super init];
    if (self) {
        self.title = title;
        self.formattedDuration = formattedDuration;
    }
    
    return self;
}

@end


NS_ASSUME_NONNULL_END
