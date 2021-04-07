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
        Person *p = [[Person alloc] init];
        p.age = 10;
//        p.block = ^{
//            NSLog(@"%d", p.age);
//        };
        
        [p test];
        
        NSLog(@"-------------");
    }
    return 0;
}
