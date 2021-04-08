//
//  main.m
//  18_interview_runtime_resolver
//
//  Created by Ankui on 4/8/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
        [p test];
    }
    return 0;
}
