//
//  ProxyTask.m
//  34_interview_timer
//
//  Created by Ankui on 4/12/21.
//

#import "ProxyTask.h"
#import <objc/runtime.h>

@implementation ProxyTask

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

+ (instancetype)proxyWithTarget:(id)target {
    ProxyTask *p = [[self alloc] init];
    p.target = target;
    return p;
}

// message forward
- (id)forwardingTargetForSelector:(SEL)aSelector {
    return self.target;
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//
//}

@end
