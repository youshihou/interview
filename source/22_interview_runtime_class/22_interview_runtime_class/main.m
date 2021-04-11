//
//  main.m
//  22_interview_runtime_class
//
//  Created by Ankui on 4/9/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 只要是继承NSObject类都返回1
        NSLog(@"%d", [[NSObject class] isKindOfClass:[NSObject class]]); // 1
        
        NSLog(@"%d", [[NSObject class] isMemberOfClass:[NSObject class]]); // 0
        NSLog(@"%d", [[Person class] isKindOfClass:[Person class]]); // 0
        NSLog(@"%d", [[Person class] isMemberOfClass:[Person class]]); // 0
        
        
//        NSLog(@"%d", [NSObject isKindOfClass:[NSObject class]]);
//        NSLog(@"%d", [NSObject isMemberOfClass:[NSObject class]]);
//        NSLog(@"%d", [Person isKindOfClass:[Person class]]);
//        NSLog(@"%d", [Person isMemberOfClass:[Person class]]);
        
        
        
        
        NSLog(@"%d", [Person isKindOfClass:object_getClass([Person class])]); // 1
        NSLog(@"%d", [Person isMemberOfClass:object_getClass([NSObject class])]); // 0
    }
    return 0;
}

/*
 + (id)self {
     return (id)self;
 }

 - (id)self {
     return self;
 }

 + (Class)class {
     return self;
 }

 - (Class)class {
     return object_getClass(self);
 }

 + (Class)superclass {
     return self->getSuperclass();
 }

 - (Class)superclass {
     return [self class]->getSuperclass();
 }

 + (BOOL)isMemberOfClass:(Class)cls {
     return self->ISA() == cls;
 }

 - (BOOL)isMemberOfClass:(Class)cls {
     return [self class] == cls;
 }

 + (BOOL)isKindOfClass:(Class)cls {
     for (Class tcls = self->ISA(); tcls; tcls = tcls->getSuperclass()) {
         if (tcls == cls) return YES;
     }
     return NO;
 }

 - (BOOL)isKindOfClass:(Class)cls {
     for (Class tcls = [self class]; tcls; tcls = tcls->getSuperclass()) {
         if (tcls == cls) return YES;
     }
     return NO;
 }
 
 */
