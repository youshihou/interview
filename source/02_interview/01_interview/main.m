//
//  main.m
//  01_interview
//
//  Created by Ankui on 4/2/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>


// clang -rewrite-objc main.m -o main.cpp

// xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp


@interface Student : NSObject {
    @public
    int _no;
    int _age;
}

@end

@implementation Student

@end





struct NSObject_IMPL {
    Class isa;
};

struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int _age;
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu = [[Student alloc] init];
        stu->_no = 4;
        stu->_age = 5;
        
        struct Student_IMPL *stuImpl = (__bridge struct Student_IMPL *)(stu);
        NSLog(@"no = %d, age = %d", stuImpl->_no, stuImpl->_age);
        
        NSLog(@"%zd", class_getInstanceSize([Student class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)(stu)));
    }
    return 0;
}
