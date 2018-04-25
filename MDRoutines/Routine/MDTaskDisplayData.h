//
//  MDTaskDisplayData.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN


@interface MDTaskDisplayData : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *formattedDuration;

+ (instancetype)new NS_UNAVAILABLE;
+ (instancetype)displayDataWithTitle:(NSString *)title formattedDuration:(NSString *)formattedDuration;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithTitle:(NSString *)title formattedDuration:(NSString *)formattedDuration NS_DESIGNATED_INITIALIZER;

@end


NS_ASSUME_NONNULL_END
