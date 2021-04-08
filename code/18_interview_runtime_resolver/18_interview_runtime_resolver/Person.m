//
//  Person.m
//  18_interview_runtime_resolver
//
//  Created by Ankui on 4/8/21.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

//- (void)test {
//    NSLog(@"%s", __func__);
//}


void c_other(id self, SEL _cmd) {
    NSLog(@"%s, %@, %@", __func__, self, NSStringFromSelector(_cmd));
}

- (void)other {
    NSLog(@"%s", __func__);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"%s", __func__);
    if (@selector(test) == sel) {
//        Method method = class_getInstanceMethod(self, @selector(other));
//        IMP imp = method_getImplementation(method);
//        const char *types = method_getTypeEncoding(method);
//        class_addMethod(self, sel, imp, types);
        
        class_addMethod(self, sel, (IMP)c_other, "v16@0:8");
        
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
