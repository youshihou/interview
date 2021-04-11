//
//  Student.m
//  21_interview_runtime_super
//
//  Created by Ankui on 4/8/21.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student

- (instancetype)init {
    self = [super init];
    if (self) {
        // objc_msgSend(self, @selector(class));
        NSLog(@"%@", [self class]); // Student
        NSLog(@"%@", [self superclass]); // Person
        
        // 方法调用者就是消息接收者
        // objc_msgSendSuper({self, [Person class]}, @selector(class));
        
        // [super message] 消息接收者仍然是子类对象，只不过从父类的类对象里开始去搜索方法
        
        NSLog(@"%@", [super class]); // Student
        NSLog(@"%@", [super superclass]); // Person
    }
    return self;
}

- (void)run {
    [super run];
    
    //     ((void (*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("Student"))}, sel_registerName("run"));
    

    NSLog(@"%s", __func__);
}

@end





//@implementation NSObjcet
//
//- (Class)class {
//    // 谁调用这个方法就返回谁的类型
//    return object_getClass(self);
//}
//
//- (Class)superClass {
//    // 取决于消息接收者self的类型
//    return [self class]->superClass;
//    return class_getSuperclass(object_getClass(self));
//}
//
//@end
