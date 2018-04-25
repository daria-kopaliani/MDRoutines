//
//  ViewController.m
//  MDRoutines
//
//  Created by Daria Kopaliani on 4/2/18.
//  Copyright © 2018 Daria Kopaliani. All rights reserved.
//

#import "ViewController.h"
#import "MDAssembly.h"


@interface ViewController ()

@property (nonatomic, strong) MDAssembly *assemlby;

@end


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.assemlby = [MDAssembly new];
    [self.assemlby setUpWithRootViewController:self];
}

@end
