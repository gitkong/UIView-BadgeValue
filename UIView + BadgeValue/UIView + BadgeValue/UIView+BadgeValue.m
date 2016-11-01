//
//  UIView+BadgeValue.m
//  OC_Demo
//
//  Created by clarence on 16/11/1.
//  Copyright © 2016年 clarence. All rights reserved.
//

#import "UIView+BadgeValue.h"
#import <objc/runtime.h>

static char fl_badgeValue_static;

static CGFloat fl_badgeValue_height = 15;

@implementation UIView (BadgeValue)

- (void)setFl_badgeValue:(NSString *)fl_badgeValue{
    objc_setAssociatedObject(self, &fl_badgeValue_static, fl_badgeValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (fl_badgeValue == nil || [fl_badgeValue isEqualToString:@""] || fl_badgeValue.integerValue <= 0) {
        [self fl_clearBadgeValue];
    }
    else{
//        NSAssert([self fl_isAllNumber:fl_badgeValue], @"字符串内容必须是数字");
        CGRect rect = [fl_badgeValue  boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont smallSystemFontSize]]} context:nil];
        // 创建红点
        UIButton *redBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, rect.size.width > fl_badgeValue_height ? rect.size.width + 6 : fl_badgeValue_height, fl_badgeValue_height)];
        redBtn.tag = 1008611;
        redBtn.layer.cornerRadius = fl_badgeValue_height / 2;
        redBtn.layer.masksToBounds = YES;
        redBtn.titleLabel.font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
        redBtn.center = CGPointMake(self.frame.size.width, 0);
        redBtn.backgroundColor = [UIColor redColor];
        [redBtn setTitle:fl_badgeValue forState:UIControlStateNormal];
        [self addSubview:redBtn];
    }
}

- (NSString *)fl_badgeValue{
    NSString *badgeValue = objc_getAssociatedObject(self, &fl_badgeValue_static);
    // 少于0 重置为0
    if (badgeValue.integerValue < 0) {
        return @"0";
    }
    else{
        return badgeValue;
    }
}

- (void)fl_clearBadgeValue{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]] && view.tag == 1008611) {
            [view removeFromSuperview];
        }
    }
}

// 判断是否全是数字
- (BOOL)fl_isAllNumber:(NSString *)text{
    unichar str;
    for (NSInteger index = 0; index < text.length; index ++) {
        str = [text characterAtIndex:index];
        if (isdigit(str)) {
            return YES;
        }
    }
    return NO;
}

@end
