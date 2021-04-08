//
//  main.m
//  20_interview_runtime_dynamic
//
//  Created by Ankui on 4/8/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        p.age = 10;
        NSLog(@"%d", p.age);
    }
    return 0;
}
