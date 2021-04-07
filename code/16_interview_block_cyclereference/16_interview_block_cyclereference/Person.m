//
//  Person.m
//  16_interview_block_cyclereference
//
//  Created by Ankui on 4/7/21.
//

#import "Person.h"

@implementation Person

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)test {
//    __weak Person *weakSelf = self;
    __weak typeof(self) weakSelf = self;
//    __unsafe_unretained typeof(self) weakSelf = self;
    self.block = ^{
        NSLog(@"%d", weakSelf.age);
    };
}

@end
