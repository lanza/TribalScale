#import "UsersAPI.h"
#import "User.h"

@interface UsersAPI ()

@property NSString *url;

@end

@implementation UsersAPI

- (instancetype)init {
    if (self = [super init]) {
        _url = @"https://randomuser.me/api/?results=100";
    }
    
    return self;
}
- (void) getUsersWithCompletion:(void (^)(NSArray<User*>*))completion {
    NSURL* url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"%@", error);
        }
        
        if (data != nil) {
            NSError *jsonError;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            if (jsonError != nil) {
                NSLog(@"%@", jsonError);
            }
            if (json != nil) {
                NSArray<User *>* users = [User fromJSON:json];
                completion(users);
            } else {
                completion([[NSArray<User *> alloc]init]);
            }
        } else {
            completion([[NSArray<User *> alloc]init]);
        }
        NSLog(@"API done");
    }];
    [task resume];
    
}

@end
