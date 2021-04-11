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

//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (@selector(test) == aSelector) {
//        return [[Cat alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}


//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (@selector(test) == aSelector) {
//        return nil;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
//
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    if (@selector(test) == aSelector) {
//        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    anInvocation.target = [[Cat alloc] init];
//    [anInvocation invoke];
//}



//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//    if (@selector(test:) == aSelector) {
//        return [NSMethodSignature signatureWithObjCTypes:"i20@0:8i16"];
////        return [[[Cat alloc] init] methodSignatureForSelector:aSelector];
//    }
//    return [super methodSignatureForSelector:aSelector];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
////    int age;
////    [anInvocation getArgument:&age atIndex:2];
////    NSLog(@"%d", age);
//
//    [anInvocation invokeWithTarget:[[Cat alloc] init]];
//    int ret;
//    [anInvocation getReturnValue:&ret];
//    NSLog(@"%d", ret);
//}






+ (id)forwardingTargetForSelector:(SEL)aSelector {
    if (@selector(test) == aSelector) {
//        return [Cat class];
        return [[Cat alloc] init];
        
        // objc_msgSend([Cat class], @selector(test));
    }
    return [super forwardingTargetForSelector:aSelector];
}

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (@selector(test) == aSelector) {
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    return [super methodSignatureForSelector:aSelector];
}

+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s", __func__);
}

@end
