//
//  Person+Test.m
//  10_interview_category_associatedobject
//
//  Created by Ankui on 4/5/21.
//

#import "Person+Test.h"
#import <objc/runtime.h>

@implementation Person (Test)

//static const void *NameKey = &NameKey;
//static const void *WeightKey = &WeightKey;

//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, NameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, NameKey);
//}
//
//- (void)setWeight:(int)weight {
//    objc_setAssociatedObject(self, WeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (int)weight {
//    return [objc_getAssociatedObject(self, WeightKey) intValue];
//}




//static const char NameKey;
//static const char WeightKey;
//
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, &NameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, &NameKey);
//}
//
//- (void)setWeight:(int)weight {
//    objc_setAssociatedObject(self, &WeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (int)weight {
//    return [objc_getAssociatedObject(self, &WeightKey) intValue];
//}



//#define NameKey @"name"
//#define WeightKey @"weight"
//
//- (void)setName:(NSString *)name {
//    objc_setAssociatedObject(self, NameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
//}
//
//- (NSString *)name {
//    return objc_getAssociatedObject(self, NameKey);
//}
//
//- (void)setWeight:(int)weight {
//    objc_setAssociatedObject(self, WeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (int)weight {
//    return [objc_getAssociatedObject(self, WeightKey) intValue];
//}





- (void)setName:(NSString *)name {
//    NSLog(@"%@ - %@", self, NSStringFromSelector(_cmd));
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
//    return objc_getAssociatedObject(self, @selector(name));
    
//    NSLog(@"%@ - %@", self, NSStringFromSelector(_cmd));
//    _cmd = @selector(name);
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWeight:(int)weight {
    objc_setAssociatedObject(self, @selector(weight), @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)weight {
//    return [objc_getAssociatedObject(self, @selector(weight)) intValue];
    
//    _cmd = @selector(weight);
    return [objc_getAssociatedObject(self, _cmd) intValue];
}


@end
