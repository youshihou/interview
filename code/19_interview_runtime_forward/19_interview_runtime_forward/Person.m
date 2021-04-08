//
//  Person.m
//  19_interview_runtime_forward
//
//  Created by Ankui on 4/8/21.
//

#import "Person.h"
#import <objc/runtime.h>
#import "Cat.h"

@implementation Person

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    if (@selector(test) == sel) {
//
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (@selector(test) == aSelector) {
        return [[Cat alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
