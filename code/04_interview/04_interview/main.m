//
//  main.m
//  04_interview
//
//  Created by Ankui on 4/4/21.
//

#import <Foundation/Foundation.h>
#import "NSObject+Test.h"

@interface Person : NSObject

+ (void)test;

@end

@implementation Person

//+ (void)test {
//    NSLog(@"%s---%p", __func__, self);
//}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Person class: %p", [Person class]);
        NSLog(@"NSObject class: %p", [NSObject class]);
        [Person test];
        [NSObject test];
    }
    return 0;
}
