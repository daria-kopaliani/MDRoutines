//
//  MDViewInterfaceIO.h
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN


@protocol MDViewInterface <NSObject>

@end


@protocol MDViewInterfaceDelegate <NSObject>

- (void)viewInterfaceDidLoad:(id<MDViewInterface>)viewInterface;

@end


NS_ASSUME_NONNULL_END

