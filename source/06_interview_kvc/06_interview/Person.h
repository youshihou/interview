//
//  Person.h
//  06_interview
//
//  Created by Ankui on 4/5/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cat : NSObject

@property (nonatomic, assign) int weight;

@end

@interface Person : NSObject

@property (nonatomic, assign) int age;

@property (nonatomic, strong) Cat *cat;

@end

NS_ASSUME_NONNULL_END
