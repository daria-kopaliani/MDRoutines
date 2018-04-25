//
//  MDTaskTableViewCell.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

@class MDTaskDisplayData;


NS_ASSUME_NONNULL_BEGIN


@interface MDTaskTableViewCell : UITableViewCell

@property (nonatomic, strong, readonly) MDTaskDisplayData *task;

- (void)configureWithTask:(MDTaskDisplayData *)task;

@end


NS_ASSUME_NONNULL_END
