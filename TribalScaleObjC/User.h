#import <Foundation/Foundation.h>

@interface User : NSObject

@property NSString *firstName;
@property NSString *lastName;

+ (NSArray<User*>*) fromJSON:(NSDictionary*)json;

@end
