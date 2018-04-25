//
//  MDRoutineDisplayData.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineDisplayData.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineDisplayData ()

@property (nonatomic, copy) NSString *formattedDuration;
@property (nonatomic, strong) NSArray<MDTaskDisplayData *> *tasks;
@property (nonatomic, copy) NSString *title;

@end


@implementation MDRoutineDisplayData

+ (instancetype)displayDataWithTitle:(NSString *)title
                               tasks:(NSArray<MDTaskDisplayData *> *)tasks
                   formattedDuration:(NSString *)formattedDuration {
    
    return [[self alloc] initWithTitle:title
                                 tasks:tasks
                     formattedDuration:formattedDuration];
}

- (instancetype)initWithTitle:(NSString *)title
                        tasks:(NSArray<MDTaskDisplayData *> *)tasks
            formattedDuration:(NSString *)formattedDuration {
    
    NSParameterAssert(title);
    NSParameterAssert(tasks);
    NSParameterAssert(formattedDuration);
    
    self = [super init];
    if (self) {
        self.title = title;
        self.tasks = tasks;
        self.formattedDuration = formattedDuration;
    }
    
    return self;
}

@end


NS_ASSUME_NONNULL_END
