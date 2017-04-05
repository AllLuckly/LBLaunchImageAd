//
//  NSObject+LBLaunchImage.h
//  LBLaunchImageAdDemo
//
//  Created by gold on 17/4/1.
//  Copyright © 2017年 Bison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBLaunchImageAdView.h"

@interface NSObject (LBLaunchImage)


+ (void)makeLBLaunchImageAdView:(void(^)(LBLaunchImageAdView *))block;

@end
