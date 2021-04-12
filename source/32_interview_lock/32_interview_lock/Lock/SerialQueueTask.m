//
//  SerialQueueTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/12/21.
//

#import "SerialQueueTask.h"

@interface SerialQueueTask ()

@property (nonatomic, strong) dispatch_queue_t ticketqueue;
@property (nonatomic, strong) dispatch_queue_t moneyqueue;

@end

@implementation SerialQueueTask

- (instancetype)init {
    self = [super init];
    if (self) {
        _ticketqueue = dispatch_queue_create("ticketqueue", DISPATCH_QUEUE_SERIAL);
        _moneyqueue = dispatch_queue_create("moneyqueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)_saleTicket {
    dispatch_sync(self.ticketqueue, ^{
        [super _saleTicket];
    });
}

- (void)_saveMoney {
    dispatch_sync(self.moneyqueue, ^{
        [super _saveMoney];
    });
}

- (void)_takeMoney {
    dispatch_sync(self.moneyqueue, ^{
        [super _takeMoney];
    });
}

@end
