//
//  MDRoutine.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

@class MDTask;


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutine : NSObject

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray<MDTask *> *tasks;

+ (instancetype)new NS_UNAVAILABLE;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithIdentifier:(NSString *)identifier NS_DESIGNATED_INITIALIZER;

@end


NS_ASSUME_NONNULL_END
