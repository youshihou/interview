//
//  main.m
//  03_interview
//
//  Created by Ankui on 4/3/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj1 = [[NSObject alloc] init];
        NSObject *obj2 = [[NSObject alloc] init];
        NSLog(@"%p, %p", obj1, obj2);
        
        Class cls1 = [obj1 class];
        Class cls2 = [obj2 class];
        Class cls3 = object_getClass(obj1);
        Class cls4 = object_getClass(obj2);
        Class cls5 = [NSObject class];
        
        NSLog(@"%p, %p, %p, %p, %p", cls1, cls2, cls3, cls4, cls5);
    }
    return 0;
}
