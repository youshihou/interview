//
//  main.m
//  15_interview_block_object__block
//
//  Created by Ankui on 4/7/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

typedef void(^Block)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        __block Person *p = [[Person alloc] init];
        
//        Person *p = [[Person alloc] init];
//        __block __weak Person *weakP = p;
//        Block block = ^{
////            NSLog(@"%p", p);
//            NSLog(@"%p", weakP);
//        };
//        block();
        
        
//        Block block;
//        {
//            __block Person *p = [[Person alloc] init];
//            block = ^{
//                NSLog(@"%p", p);
//            };
//        }
//        block();
        
        
        Block block;
        {
            Person *p = [[Person alloc] init];
            __block __weak Person *weakP = p;
            block = ^{
                NSLog(@"%p", weakP);
            };
        }
        block();

    }
    return 0;
}
