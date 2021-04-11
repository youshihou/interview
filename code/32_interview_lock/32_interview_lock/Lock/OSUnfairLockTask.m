//
//  OSUnfairLockTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import "OSUnfairLockTask.h"
#import <os/lock.h>

@interface OSUnfairLockTask ()

@property (nonatomic, assign) os_unfair_lock ticketlock;
@property (nonatomic, assign) os_unfair_lock moneylock;

@end

@implementation OSUnfairLockTask

- (instancetype)init {
    self = [super init];
    if (self) {
        _ticketlock = OS_UNFAIR_LOCK_INIT;
        _moneylock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)_saleTicket {
    os_unfair_lock_lock(&_ticketlock);
    [super _saleTicket];
    os_unfair_lock_unlock(&_ticketlock);
}

- (void)_saveMoney {
    os_unfair_lock_lock(&_moneylock);
    [super _saveMoney];
    os_unfair_lock_unlock(&_moneylock);
}

- (void)_takeMoney {
    os_unfair_lock_lock(&_moneylock);
    [super _takeMoney];
    os_unfair_lock_unlock(&_moneylock);
}

@end
