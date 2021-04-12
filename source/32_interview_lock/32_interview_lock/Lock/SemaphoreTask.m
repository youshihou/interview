//
//  SemaphoreTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/12/21.
//

#import "SemaphoreTask.h"

@interface SemaphoreTask ()

@property (nonatomic, strong) dispatch_semaphore_t semaphore;

@end

@implementation SemaphoreTask

- (instancetype)init {
    self = [super init];
    if (self) {
        _semaphore = dispatch_semaphore_create(5);
    }
    return self;
}

- (void)testOther {
    for (NSInteger i = 0; i < 20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil] start];
    }
}

- (void)test {
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    sleep(2);
    NSLog(@"%@", [NSThread currentThread]);
    dispatch_semaphore_signal(self.semaphore);
}

@end
