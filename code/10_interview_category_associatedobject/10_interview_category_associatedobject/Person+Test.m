//
//  Person+Test.m
//  10_interview_category_associatedobject
//
//  Created by Ankui on 4/5/21.
//

#import "Person+Test.h"
#import <objc/runtime.h>

const void *NameKey = &NameKey;
const void *WeightKey = &WeightKey;

@implementation Person (Test)

- (void)setName:(NSString *)name {
    objc_setAssociatedObject(self, NameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, NameKey);
}

- (void)setWeight:(int)weight {
    objc_setAssociatedObject(self, WeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)weight {
    return [objc_getAssociatedObject(self, WeightKey) intValue];
}

@end
