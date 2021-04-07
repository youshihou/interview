//
//  Person.h
//  17_interview_runtime
//
//  Created by Ankui on 4/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

//- (void)test;
//
//@property (nonatomic, assign, getter=isTall) BOOL tall;
//@property (nonatomic, assign, getter=isRich) BOOL rich;
//@property (nonatomic, assign, getter=isHandsome) BOOL handsome;

- (void)setTall:(BOOL)tall;
- (void)setRich:(BOOL)rich;
- (void)setHandsome:(BOOL)handsome;
- (BOOL)isTall;
- (BOOL)isRich;
- (BOOL)isHandsome;


@end

NS_ASSUME_NONNULL_END
