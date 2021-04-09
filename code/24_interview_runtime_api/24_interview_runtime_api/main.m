//
//  main.m
//  24_interview_runtime_api
//
//  Created by Ankui on 4/9/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Person.h"
#import "Car.h"


void run(id self, SEL _cmd) {
    NSLog(@"%s %@ %@", __func__, self, NSStringFromSelector(_cmd));
}

void test() {
    
//    Person *p = [[Person alloc] init];
//    [p run];
//
//    object_setClass(p, [Car class]);
//    [p run];
//
//    NSLog(@"%d %d %d",
//          object_isClass(p),
//          object_isClass([Person class]),
//          object_isClass(object_getClass([Person class])));
    
    
    Class cls = objc_allocateClassPair([NSObject class], "Dog", 0);
    class_addIvar(cls, "_age", 4, 1, @encode(int));
    class_addIvar(cls, "_weight", 4, 1, @encode(int));
    class_addMethod(cls, @selector(run), (IMP)run, "v16@0:8");
    
    objc_registerClassPair(cls);
    id dog = [[cls alloc] init];
    [dog setValue:@10 forKey:@"_age"];
    [dog setValue:@20 forKey:@"_weight"];
    NSLog(@"%zd %@ %@", class_getInstanceSize(cls), [dog valueForKey:@"_age"], [dog valueForKey:@"_weight"]);
    [dog run];
    
    objc_disposeClassPair(cls);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Ivar ivar = class_getInstanceVariable([Person class], "_age");
        NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
        
        Person *p = [[Person alloc] init];
        object_setIvar(p, ivar, (__bridge id _Nullable)((void *)100));
        NSLog(@"%d", p.age);

        ivar = class_getInstanceVariable([Person class], "_name");
        object_setIvar(p, ivar, @"666");
        object_getIvar(p, ivar);
        NSLog(@"%@", p.name);
        
        unsigned int count;
        Ivar *ivars = class_copyIvarList([Person class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
        }
        free(ivars);
    }
    return 0;
}
