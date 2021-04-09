//
//  UIControl+Extension.m
//  25_interview_runtime_exchange
//
//  Created by Ankui on 4/9/21.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

@implementation UIControl (Extension)

+ (void)load {
    Method m1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method m2 = class_getInstanceMethod(self, @selector(xx_sendAction:to:forEvent:));
    method_exchangeImplementations(m1, m2);
}

- (void)xx_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"%@ %@ %@", self, NSStringFromSelector(action), target);
    if ([self isKindOfClass:[UIButton class]]) {
        // 调用系统原来自带的方法
        [self xx_sendAction:action to:target forEvent:event];
    } else {
        
    }
}

@end
