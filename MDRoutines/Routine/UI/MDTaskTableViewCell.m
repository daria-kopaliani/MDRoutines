//
//  MDTaskTableViewCell.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "MDTaskTableViewCell.h"

#import "MDTaskDisplayData.h"


NS_ASSUME_NONNULL_BEGIN


@interface MDTaskTableViewCell ()

@property (nonatomic, strong) MDTaskDisplayData *task;

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;

@end


@implementation MDTaskTableViewCell

- (void)configureWithTask:(MDTaskDisplayData *)task {
 
    NSParameterAssert(task);
    
    self.titleLabel.text = task.title;
    self.subtitleLabel.text = task.formattedDuration;
}

@end


NS_ASSUME_NONNULL_END
