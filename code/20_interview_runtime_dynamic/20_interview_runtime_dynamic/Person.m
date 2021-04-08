//
//  Person.m
//  20_interview_runtime_dynamic
//
//  Created by Ankui on 4/8/21.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

//@synthesize age = _age; // 自动生成getter和setter的声明和实现，自动生成下划线成员变量


void setAge(id self, SEL _cmd, int age) {
    NSLog(@"%s, %@, %d", __func__, self, age);
}

int age(id self, SEL _cmd) {
    return 10;
}

@dynamic age; // 有自动生成getter和setter的声明， 但没有自动生成实现，也没有自动生成下划线成员变量

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(setAge:)) {
        class_addMethod(self, sel, (IMP)setAge, "v20@0:8i16");
        return YES;
    } else if (sel == @selector(age)) {
        class_addMethod(self, sel, (IMP)age, "v16@0:8");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}


@end
