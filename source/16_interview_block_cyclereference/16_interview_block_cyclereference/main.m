//
//  main.m
//  16_interview_block_cyclereference
//
//  Created by Ankui on 4/7/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Person *p = [[Person alloc] init];
//        p.age = 10;
////        __weak Person *weakP = p;
////        __weak typeof(p) weakP = p;
////        __unsafe_unretained typeof(p) weakP = p;
////        p.block = ^{
////            NSLog(@"%d", weakP.age);
////        };
//
//        [p test];
        
        
        __block Person *p = [[Person alloc] init];
        p.age = 10;
        p.block = ^{
            NSLog(@"%d", p.age);
            p = nil;
        };
        p.block();

        NSLog(@"-------------");
    }
    return 0;
}
