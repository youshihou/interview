//
//  SemaphoreTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/12/21.
//

#import "SemaphoreTask.h"

@interface SemaphoreTask ()

@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (nonatomic, strong) dispatch_semaphore_t ticketsemaphore;
@property (nonatomic, strong) dispatch_semaphore_t moneysemaphore;

@end

@implementation SemaphoreTask

- (instancetype)init {
    self = [super init];
    if (self) {
        _semaphore = dispatch_semaphore_create(5);
        _ticketsemaphore = dispatch_semaphore_create(1);
        _moneysemaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)_saleTicket {
    dispatch_semaphore_wait(self.ticketsemaphore, DISPATCH_TIME_FOREVER);
    [super _saleTicket];
    dispatch_semaphore_signal(self.ticketsemaphore);
}

- (void)_saveMoney {
    dispatch_semaphore_wait(self.moneysemaphore, DISPATCH_TIME_FOREVER);
    [super _saveMoney];
    dispatch_semaphore_signal(self.moneysemaphore);
}

- (void)_takeMoney {
    dispatch_semaphore_wait(self.moneysemaphore, DISPATCH_TIME_FOREVER);
    [super _takeMoney];
    dispatch_semaphore_signal(self.moneysemaphore);
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
