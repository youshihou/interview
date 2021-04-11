//
//  main.m
//  17_interview_runtime
//
//  Created by Ankui on 4/7/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc] init];
//        [p test];
//        NSLog(@"%zd", class_getInstanceSize([p class]));
        
        p.tall = YES;
        p.rich = NO;
        p.handsome = NO;
        NSLog(@"%d %d %d", p.isTall, p.isRich, p.isHandsome);
    }
    return 0;
}
