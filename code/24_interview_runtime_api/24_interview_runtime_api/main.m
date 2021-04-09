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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person *p = [[Person alloc] init];
//        [p run];
//
//        object_setClass(p, [Car class]);
//        [p run];
//
//        NSLog(@"%d %d %d",
//              object_isClass(p),
//              object_isClass([Person class]),
//              object_isClass(object_getClass([Person class])));
        
        
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
    }
    return 0;
}
