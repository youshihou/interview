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



int age_ = 10;
static int height_ = 20;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test();
//        block();
        

        void(^block)(void) = ^() {
            NSLog(@"Hello, World! %d %d", age_, height_);
        };
        age_ = 20;
        height_ = 30;
        block();
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
