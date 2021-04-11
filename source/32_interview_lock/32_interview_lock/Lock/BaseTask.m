//
//  BaseTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import "BaseTask.h"

@interface BaseTask ()

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger money;

@end

@implementation BaseTask

- (void)testOther {
    
}

- (void)testTicket {
    self.count = 15;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i++) {
            [self _saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i++) {
            [self _saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 5; i++) {
            [self _saleTicket];
        }
    });
}

- (void)_saleTicket {
    NSInteger count = self.count;
    sleep(.2);
    count--;
    self.count = count;
    NSLog(@"%zd, %@", self.count, [NSThread currentThread]);
}

- (void)testMoney {
    self.money = 100;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self _saveMoney];
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self _takeMoney];
        }
    });
}

- (void)_saveMoney {
    NSInteger money = self.money;
    sleep(.2);
    money += 50;
    self.money = money;
    NSLog(@"save50, %zd, %@", self.money, [NSThread currentThread]);
}

- (void)_takeMoney {
    NSInteger money = self.money;
    sleep(.2);
    money -= 20;
    self.money = money;
    NSLog(@"take20, %zd, %@", self.money, [NSThread currentThread]);
}

@end
