//
//  MLNKuaController.m
//  LuaNative
//
//  Created by Dongpeng Dai on 2020/8/11.
//  Copyright © 2020 MoMo. All rights reserved.
//

#import "MLNKuaController.h"
#import "MLNUIViewController.h"
#import "UserData.h"
#import "MLNUIKit.h"

@interface MLNKuaController ()
@property (nonatomic, strong) UserData *model;
@end

@implementation MLNKuaController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createController];
}

- (void)createController {
    NSString *demoName = @"kuaDetail.lua";
    NSString *path = [[NSBundle mainBundle] pathForResource:@"KuaDemoMUI" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    MLNUIViewController *viewController = [[MLNUIViewController alloc] initWithEntryFileName:demoName bundle:bundle];
    
    self.model = [UserData modelForTest];
    
//    self.model.mlnui_watch(@"name", ^(id  _Nonnull oldValue, id  _Nonnull newValue, id observedObject) {
//        NSLog(@"name has changed from  %@ to %@",oldValue, newValue);
//    });
    
    [viewController bindData:self.model forKey:@"userData"];
    [viewController mlnui_addToSuperViewController:self frame:self.view.bounds];
}

@end
