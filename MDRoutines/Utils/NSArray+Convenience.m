//
//  NSArray+Convenience.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "NSArray+Convenience.h"


NS_ASSUME_NONNULL_BEGIN


@implementation NSArray (Convenience)

- (NSArray *)arrayByRemovingObject:(id)object {
    
    NSArray *result;
    if ([self containsObject:object]) {
        NSMutableArray *mutableArray = [self mutableCopy];
        [mutableArray removeObject:object];
        result = [mutableArray copy];
    } else {
        result = self;
    }
    
    return result;
}

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id _Nullable(^)(id object))block {
    
    __block NSMutableArray *collection = [NSMutableArray arrayWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id collectionItem = block(obj);
        if ([collectionItem isKindOfClass:[NSArray class]]) {
            NSArray *collectionItems = (NSArray *)collectionItem;
            if ([collectionItems count]) {
                [collection addObjectsFromArray:collectionItems];
            }
        } else if (collectionItem) {
            [collection addObject:collectionItem];
        }
    }];
    
    return [NSArray arrayWithArray:collection];
}

- (NSArray *)arrayFromObjectsCollectedWithIndexedBlock:(id _Nullable(^)(id object, NSUInteger index))block {
    
    __block NSMutableArray *collection = [NSMutableArray arrayWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id collectionItem = block(obj, idx);
        if ([collectionItem isKindOfClass:[NSArray class]]) {
            NSArray *collectionItems = (NSArray *)collectionItem;
            if ([collectionItems count]) {
                [collection addObjectsFromArray:collectionItems];
            }
        } else if (collectionItem) {
            [collection addObject:collectionItem];
        }
    }];
    
    return [NSArray arrayWithArray:collection];
}

- (NSDictionary *)dictionaryWithUniqueStringKeyPath:(NSString *)keyPath {
    
    NSParameterAssert(keyPath);
    
    return [NSDictionary dictionaryWithObjects:self forKeys:[self valueForKey:keyPath]];
}

- (NSSet *)set {
    
    return [NSSet setWithArray:self];
}

@end


NS_ASSUME_NONNULL_END

