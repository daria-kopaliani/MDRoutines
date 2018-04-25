//
//  MDActiveTaskDisplayData.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN


@interface MDActiveTaskDisplayData : NSObject

@property (nonatomic, strong, readonly) UIColor *color;
@property (nonatomic, assign, readonly) NSTimeInterval duration;
@property (nonatomic, copy, nullable, readonly) NSString *subtitle;
@property (nonatomic, copy, readonly) NSString *title;

+ (instancetype)new NS_UNAVAILABLE;
+ (instancetype)displayDataWithTitle:(NSString *)title
                            subtitle:(nullable NSString *)subtitle
                               color:(UIColor *)color
                            duration:(NSTimeInterval)duration;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithTitle:(NSString *)title
                     subtitle:(nullable NSString *)subtitle
                        color:(UIColor *)color
                     duration:(NSTimeInterval)duration NS_DESIGNATED_INITIALIZER;

@end


NS_ASSUME_NONNULL_END
