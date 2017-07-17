//
//  NSObject+LBLaunchImage.m
//  LBLaunchImageAdDemo
//
//  Created by gold on 17/4/1.
//  Copyright © 2017年 Bison. All rights reserved.
//

#import "NSObject+LBLaunchImage.h"

@implementation NSObject (LBLaunchImage)

+ (void)makeLBLaunchImageAdView:(void(^)(LBLaunchImageAdView *))block{
    
    LBLaunchImageAdView *imgAdView = [[LBLaunchImageAdView alloc]init];    
    block(imgAdView);
}
@end
