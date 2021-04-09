//
//  Person.h
//  24_interview_runtime_api
//
//  Created by Ankui on 4/9/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *name;

- (void)run;

@end

NS_ASSUME_NONNULL_END
