//
//  MDRoutineListInteractor.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDRoutineListInteractor.h"

#import "MDRoutine.h"
#import "MDTask.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDRoutineListInteractor ()

@end


@implementation MDRoutineListInteractor

#pragma mark - <MDRoutineListInteractor>

- (NSArray<MDRoutine *> *)routines {
    
    MDTask *aBreak = [MDTask breakIdentifier:@"0" title:@"Break" duration:10.f];
    
    NSMutableArray *tasks = [NSMutableArray new];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"1" title:@"Провисание в двери" duration:30.f]];
//    [tasks addObject:aBreak];
//    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Колючий шар" duration:30.f]];
//    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"100 прыжков" duration:40.f]];
//    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Колючий шар" duration:30.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Растягиваем левую подмышку" duration:30.f]];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Растягиваем правую подмышку" duration:30.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Рамка" duration:30.f]];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Рамка (растяжка вверх)" duration:20.f]];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Рамка (лимфодренаж)" duration:20.f]];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Рамка (растяжка вниз)" duration:20.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Шея вперед" duration:30.f]];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Шея назад" duration:30.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Мочки ушей" duration:30.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Вакуум живота" duration:15.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Вакуум живота" duration:15.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Вакуум живота" duration:15.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Брезгливая мордочка" duration:30.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Трем подбородок" duration:40.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Борьба с межбровкой (валик)" duration:40.f]];
    [tasks addObject:aBreak];
    [tasks addObject:[MDTask exerciseWithIdentifier:@"2" title:@"Борьба с межбровкой (перетирание)" duration:30.f]];
    MDRoutine *routine1 = [[MDRoutine alloc] initWithIdentifier:@"1"];
    routine1.title = @"Morning";
    routine1.tasks = [tasks copy];
    
    return @[routine1];
}

@end


NS_ASSUME_NONNULL_END
