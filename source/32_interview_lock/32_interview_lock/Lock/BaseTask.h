//
//  BaseTask.h
//  32_interview_lock
//
//  Created by Ankui on 4/11/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTask : NSObject

- (void)testTicket;
- (void)testMoney;

- (void)_saleTicket;
- (void)_saveMoney;
- (void)_takeMoney;

@end

NS_ASSUME_NONNULL_END
