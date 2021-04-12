//
//  NSConditionLockTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/12/21.
//

#import "NSConditionLockTask.h"

@interface NSConditionLockTask ()

@property (nonatomic, strong) NSConditionLock *cond;

@end

@implementation NSConditionLockTask

- (instancetype)init {
    self = [super init];
    if (self) {
        _cond = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)testOther {
    [[[NSThread alloc] initWithTarget:self selector:@selector(_one) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(_two) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(_three) object:nil] start];
}

- (void)_one {
    [self.cond lockWhenCondition:1];
    NSLog(@"%s", __func__);
    [self.cond unlockWithCondition:2];
}

- (void)_two {
    [self.cond lockWhenCondition:2];
    NSLog(@"%s", __func__);
    [self.cond unlockWithCondition:3];
}

- (void)_three {
    [self.cond lockWhenCondition:3];
    NSLog(@"%s", __func__);
    [self.cond unlock];
}

@end
