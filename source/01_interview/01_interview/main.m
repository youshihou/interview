//
//  main.m
//  01_interview
//
//  Created by Ankui on 4/2/21.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

//@interface Student : NSObject
//
//@end
//
//@implementation Student
//
//@end


// clang -rewrite-objc main.m -o main.cpp

// xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp



struct NSObject_IMPL {
    Class isa;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *object = [[NSObject alloc] init];
        
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        NSLog(@"%zd", malloc_size((__bridge const void *)(object)));
    }
    return 0;
}
