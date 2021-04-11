//
//  main.m
//  11_interview_block
//
//  Created by Ankui on 4/6/21.
//

#import <Foundation/Foundation.h>

//void (^block)(void);
//
//void test() {
//    auto int age = 10;
//    static int height = 20;
//    block = ^() {
//        NSLog(@"Hello, World! %d %d", age, height);
//    };
//    age = 20;
//    height = 30;
//}



//int age_ = 10;
//static int height_ = 20;
//
//
//void test() {
//    //        test();
//    //        block();
//
//
//    void(^block)(void) = ^() {
//        NSLog(@"Hello, World! %d %d", age_, height_);
//    };
//    age_ = 20;
//    height_ = 30;
//    block();
//}



//void test() {
//    void(^block1)(void) = ^() {
//        NSLog(@"Hello, World!");
//    };
//    int a = 10;
//    void(^block2)(void) = ^() {
//        NSLog(@"Hello, World! %d", a);
//    };
//
//    // __NSGlobalBlock__ NSBlock NSObject
//    NSLog(@"%@ %@ %@", [block1 class], [[block1 class] superclass], [[[block1 class] superclass] superclass]);
//
//
//    // __NSGlobalBlock__ __NSMallocBlock__ __NSStackBlock__
//    NSLog(@"%@ %@ %@", [block1 class], [block2 class], [^{
//        NSLog(@"%d", a);
//    } class]);
//}


typedef void(^Block)(void);

Block myblock() {
//    return ^{
//        NSLog(@"Hello, World!");
//    };
    
    int a = 10;
    Block block = ^{
        NSLog(@"Hello, World! %d", a);
    };
    return block;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        Block block = myblock();
//        block();
//        NSLog(@"%@", [block class]); // __NSMallocBlock__
        
        
        
        
        
//        int a = 10;
//        Block block = ^{
//            NSLog(@"Hello, World! %d", a);
//        };
//        NSLog(@"%@", [block class]); // __NSMallocBlock__
        
        
        
        
        NSLog(@"%@", [^{
            NSLog(@"Hello, World!");
        } class]); // __NSGlobalBlock__
        
        int a = 10;
        NSLog(@"%@", [^{
            NSLog(@"Hello, World! %d", a);
        } class]); // __NSStackBlock__
        
    }
    return 0;
}



//void test() {
//    auto int age = 10;
//    static int height = 20;
//    void(^block)(void) = ^() {
//        NSLog(@"Hello, World! %d %d", age, height);
//    };
//    age = 20;
//    height = 30;
//    block();
//}

//void test() {
//    int age = 10;
//    void (^block)(int, int) = ^(int a, int b) {
//        NSLog(@"%d", age);
//    };
//    block(10, 20);
//}
