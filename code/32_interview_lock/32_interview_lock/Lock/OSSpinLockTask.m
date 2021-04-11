//
//  OSSpinLockTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import "OSSpinLockTask.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockTask ()

@property (nonatomic, assign) OSSpinLock ticketLock;
@property (nonatomic, assign) OSSpinLock moneyLock;

@end

@implementation OSSpinLockTask

- (instancetype)init {
    self = [super init];
    if (self) {
        _ticketLock = OS_SPINLOCK_INIT;
        _moneyLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)_saleTicket {
    OSSpinLockLock(&_ticketLock);
    [super _saleTicket];
    OSSpinLockUnlock(&_ticketLock);
}

- (void)_saveMoney {
    OSSpinLockLock(&_moneyLock);
    [super _saveMoney];
    OSSpinLockUnlock(&_moneyLock);
}

- (void)_takeMoney {
    OSSpinLockLock(&_moneyLock);
    [super _takeMoney];
    OSSpinLockUnlock(&_moneyLock);
}

@end
