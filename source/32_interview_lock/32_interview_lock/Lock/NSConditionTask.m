//
//  NSConditionTask.m
//  32_interview_lock
//
//  Created by Ankui on 4/12/21.
//

#import "NSConditionTask.h"

@interface NSConditionTask ()

@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSCondition *cond;

@end

@implementation NSConditionTask

- (instancetype)init {
    self = [super init];
    if (self) {
        _data = [NSMutableArray array];
        _cond = [[NSCondition alloc] init];
    }
    return self;
}

- (void)testOther {
    [[[NSThread alloc] initWithTarget:self selector:@selector(_remove) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(_add) object:nil] start];
}

- (void)_add {
    [self.cond lock];
    sleep(1);
    [self.data addObject:@"666"];
    NSLog(@"%s", __func__);
    [self.cond unlock];
}

- (void)_remove {
    NSLog(@"remove");
    [self.cond lock];
    if (self.data.count == 0) {
        [self.cond wait];
    }
    [self.data removeLastObject];
    NSLog(@"%s", __func__);
    [self.cond signal];
    [self.cond unlock];
}

@end
