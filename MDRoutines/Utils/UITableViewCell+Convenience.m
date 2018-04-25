//
//  UITableViewCell+Convenience.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "UITableViewCell+Convenience.h"


NS_ASSUME_NONNULL_BEGIN


@implementation UITableViewCell (Convenience)

+ (NSString *)defaultReuseIndentifier {
    
    static NSString *BEDefaultCellIndentifier = nil;
    BEDefaultCellIndentifier = NSStringFromClass([self class]);
    
    return BEDefaultCellIndentifier;
}

+ (UINib *)defaultNib {
    
    return [UINib nibWithNibName:[self defaultNibName] bundle:nil];
}

+ (NSString *)defaultNibName {
    
    return [self defaultReuseIndentifier];
}

@end


NS_ASSUME_NONNULL_END
