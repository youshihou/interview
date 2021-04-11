//
//  NSMutableArray+Extension.m
//  25_interview_runtime_exchange
//
//  Created by Ankui on 4/9/21.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableArray (Extension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSArrayM");
        Method m1 = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));
        Method m2 = class_getInstanceMethod(cls, @selector(xx_insertObject:atIndex:));
        method_exchangeImplementations(m1, m2);
    });
}

- (void)xx_insertObject:(id)anObject atIndex:(NSUInteger)index {
//    NSLog(@"%s", __func__);
    if (!anObject) { return; }
    [self xx_insertObject:anObject atIndex:index];
}

@end
