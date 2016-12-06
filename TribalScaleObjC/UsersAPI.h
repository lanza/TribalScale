#import <Foundation/Foundation.h>

@class User;

@interface UsersAPI : NSObject

- (void) getUsersWithCompletion:(void (^)(NSArray<User*>*))completion;

@end
