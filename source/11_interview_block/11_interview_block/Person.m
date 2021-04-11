//
//  Person.m
//  11_interview_block
//
//  Created by Ankui on 4/6/21.
//

#import "Person.h"

@implementation Person

- (void)test {
    void(^block)(void) = ^() {
        NSLog(@"-----------%p", self);
    };
    block();
}

@end
