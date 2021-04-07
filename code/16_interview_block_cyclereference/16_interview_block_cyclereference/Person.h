//
//  Person.h
//  16_interview_block_cyclereference
//
//  Created by Ankui on 4/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, copy) void(^block)(void);

- (void)test;

@end

NS_ASSUME_NONNULL_END
