//
//  NSLockTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/12/21.
//

#import "NSLockTask.h"

@interface NSLockTask ()

@property (nonatomic, strong) NSLock *ticketlock;
@property (nonatomic, strong) NSLock *moneylock;

@end

@implementation NSLockTask

- (instancetype)init {
    self = [super init];
    if (self) {
        _ticketlock = [[NSLock alloc] init];
        _moneylock = [[NSLock alloc] init];
    }
    return self;
}

- (void)_saleTicket {
    [self.ticketlock lock];
    [super _saleTicket];
    [self.ticketlock unlock];
}

- (void)_saveMoney {
    [self.moneylock lock];
    [super _saveMoney];
    [self.moneylock unlock];
}

- (void)_takeMoney {
    [self.moneylock lock];
    [super _takeMoney];
    [self.moneylock unlock];
}
@end
