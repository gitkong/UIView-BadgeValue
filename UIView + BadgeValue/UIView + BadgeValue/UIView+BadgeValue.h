//
//  UIView+BadgeValue.h
//  OC_Demo
//
//  Created by clarence on 16/11/1.
//  Copyright © 2016年 clarence. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BadgeValue)
/**
 *  @author Clarence
 *
 *  设置消息数，设置小于或等于0 、@"" 、nil 就隐藏
 */
@property (nonatomic,copy)NSString *fl_badgeValue;

@end
