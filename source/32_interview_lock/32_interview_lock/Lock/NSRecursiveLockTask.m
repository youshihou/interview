//
//  NSRecursiveLockTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/12/21.
//

#import "NSRecursiveLockTask.h"

@interface NSRecursiveLockTask ()

@property (nonatomic, strong) NSRecursiveLock *lock;

@end

@implementation NSRecursiveLockTask

- (instancetype)init {
    self = [super init];
    if (self) {
        _lock = [[NSRecursiveLock alloc] init];
    }
    return self;
}

- (void)testOther {
    [self.lock lock];
    NSLog(@"%s", __func__);
    static NSInteger count = 0;
    if (count < 10) {
        count++;
        [self testOther];
    }
    [self.lock unlock];
}

@end
