//
//  MDActiveTaskDisplayData.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDActiveTaskDisplayData.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDActiveTaskDisplayData ()

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, nullable, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *title;

@end


@implementation MDActiveTaskDisplayData

+ (instancetype)displayDataWithTitle:(NSString *)title
                            subtitle:(nullable NSString *)subtitle
                               color:(UIColor *)color
                            duration:(NSTimeInterval)duration {
    
    return [[self alloc] initWithTitle:title
                              subtitle:subtitle
                                 color:color
                              duration:duration];
}

- (instancetype)initWithTitle:(NSString *)title
                     subtitle:(nullable NSString *)subtitle
                        color:(UIColor *)color
                     duration:(NSTimeInterval)duration {
    
    NSParameterAssert(title);
    NSParameterAssert(color);
    
    self = [super init];
    if (self) {
        self.title = title;
        self.subtitle = subtitle;
        self.color = color;
        self.duration = duration;
    }
    
    return self;
}

@end


NS_ASSUME_NONNULL_END
