//
//  Person.h
//  23_interview_runtime_super
//
//  Created by Ankui on 4/9/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

- (void)print;

@end

NS_ASSUME_NONNULL_END
