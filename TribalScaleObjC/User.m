#import "User.h"

@implementation User

+ (NSArray<User *> *)fromJSON:(NSDictionary *)json {
    NSMutableArray<User *> *users = [[NSMutableArray alloc] init];
    
    NSArray *arrayOfUserJson = json[@"results"];
    
    for (int i = 0; i < arrayOfUserJson.count; i++) {
        NSDictionary *dict = arrayOfUserJson[i];
        NSDictionary *nameDict = dict[@"name"];
        
        User *user = [[User alloc] init];
        
        user.firstName = nameDict[@"first"];
        user.lastName = nameDict[@"last"];
        
        [users addObject:user];
    }
    
    return users;
}

@end
