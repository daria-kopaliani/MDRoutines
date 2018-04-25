//
//  MDRoutineDisplayData.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

@class MDTaskDisplayData;


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineDisplayData : NSObject

@property (nonatomic, copy, readonly) NSString *formattedDuration;
@property (nonatomic, strong, readonly) NSArray<MDTaskDisplayData *> *tasks;
@property (nonatomic, copy, readonly) NSString *title;

+ (instancetype)new NS_UNAVAILABLE;
+ (instancetype)displayDataWithTitle:(NSString *)title
                               tasks:(NSArray<MDTaskDisplayData *> *)tasks
                   formattedDuration:(NSString *)formattedDuration;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithTitle:(NSString *)title
                        tasks:(NSArray<MDTaskDisplayData *> *)tasks
            formattedDuration:(NSString *)formattedDuration NS_DESIGNATED_INITIALIZER;

@end


NS_ASSUME_NONNULL_END
