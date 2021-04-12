//
//  SynchronizedTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/12/21.
//

#import "SynchronizedTask.h"

@implementation SynchronizedTask

- (void)_saleTicket {
    @synchronized (self) {
        [super _saleTicket];
    }
}

- (void)_saveMoney {
    @synchronized (self) {
        [super _saveMoney];
    }
}

- (void)_takeMoney {
    @synchronized (self) {
        [super _takeMoney];
    }
}

- (void)testOther {
    @synchronized (self) {
        NSLog(@"%s", __func__);
        static NSInteger count = 0;
        if (count < 10) {
            count++;
            [self testOther];
        }
    }
}

@end
