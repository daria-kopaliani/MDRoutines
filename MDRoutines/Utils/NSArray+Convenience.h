//
//  NSArray+Convenience.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN


@interface NSArray (Convenience)

- (NSArray *)arrayByRemovingObject:(id)object;
- (NSArray *)arrayFromObjectsCollectedWithBlock:(id _Nullable(^)(id object))block;
- (NSArray *)arrayFromObjectsCollectedWithIndexedBlock:(id _Nullable(^)(id object, NSUInteger index))block;

- (NSDictionary *)dictionaryWithUniqueStringKeyPath:(NSString *)keyPath;

- (NSSet *)set;

@end


NS_ASSUME_NONNULL_END

