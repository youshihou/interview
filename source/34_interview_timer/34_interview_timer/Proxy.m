//
//  Proxy.m
//  34_interview_timer
//
//  Created by Ankui on 4/12/21.
//

#import "Proxy.h"

@interface Proxy ()

@property (nonatomic, weak) id target;

@end

@implementation Proxy

+ (instancetype)proxyWithTarget:(id)target {
    Proxy *p = [self alloc];
    p.target = target;
    return p;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

@end
