//
//  NSMutableDictionary+Extension.m
//  25_interview_runtime_exchange
//
//  Created by Ankui on 4/9/21.
//

#import "NSMutableDictionary+Extension.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Extension)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSDictionaryM");
        Method m1 = class_getInstanceMethod(cls, @selector(setObject:forKeyedSubscript:));
        Method m2 = class_getInstanceMethod(cls, @selector(xx_setObject:forKeyedSubscript:));
        method_exchangeImplementations(m1, m2);
        
        cls = NSClassFromString(@"__NSDictionaryI");
        m1 = class_getInstanceMethod(cls, @selector(objectForKeyedSubscript:));
        m2 = class_getInstanceMethod(cls, @selector(xx_objectForKeyedSubscript:));
        method_exchangeImplementations(m1, m2);
    });
}

- (void)xx_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
//    NSLog(@"%s", __func__);
    if (!key) { return; }
    [self xx_setObject:obj forKeyedSubscript:key];
}

- (id)xx_objectForKeyedSubscript:(id)key {
//    NSLog(@"%s", __func__);
    if (!key) { return nil; }
    return [self xx_objectForKeyedSubscript:key];
}

@end
