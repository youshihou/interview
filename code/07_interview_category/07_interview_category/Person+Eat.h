//
//  Person+Eat.h
//  07_interview_category
//
//  Created by Ankui on 4/5/21.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Eat) <NSCopying, NSCoding>

- (void)eat;
+ (void)eat2;

@property (nonatomic, assign) int weight;
@property (nonatomic, assign) double height;

@end

NS_ASSUME_NONNULL_END
