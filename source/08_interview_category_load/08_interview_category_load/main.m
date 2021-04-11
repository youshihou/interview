//
//  main.m
//  08_interview_category_load
//
//  Created by Ankui on 4/5/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
//#import "Person+Test1.h"
//#import "Person+Test2.h"
#import <objc/runtime.h>

void printMethodNamesOfClass(Class cls) {
    unsigned int count;
    Method *list = class_copyMethodList(cls, &count);
    NSMutableString *names = [NSMutableString string];
    for (int i = 0; i < count; i++) {
        Method method = list[i];
        NSString *name = NSStringFromSelector(method_getName(method));
        [names appendString:name];
        [names appendString:@", "];
    }
    free(list);
    NSLog(@"%@ %@", cls, names);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [Person test];
        
//        printMethodNamesOfClass(object_getClass([Person class]));
    }
    return 0;
}
