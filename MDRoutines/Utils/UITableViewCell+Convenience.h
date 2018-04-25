//
//  UITableViewCell+Convenience.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN


@interface UITableViewCell (Convenience)

+ (UINib *)defaultNib;
+ (NSString *)defaultNibName;
+ (NSString *)defaultReuseIndentifier;

@end


NS_ASSUME_NONNULL_END
