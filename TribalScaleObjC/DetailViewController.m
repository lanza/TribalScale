#import "DetailViewController.h"
#import "User.h"

@interface DetailViewController ()

@property UILabel *label;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectZero];
    
    self.label.text = [NSString stringWithFormat:@"%@, %@", self.user.lastName, self.user.firstName];
    
    [self setupConstraints];
}

- (void)setupConstraints {
    
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.label];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [self.label.leadingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.leadingAnchor],
                                              [self.label.trailingAnchor constraintEqualToAnchor:self.view.layoutMarginsGuide.trailingAnchor],
                                              [self.label.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor],
                                              [self.label.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.topAnchor]
                                              ]];
}



@end
