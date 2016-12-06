#import "MainViewController.h"
#import "User.h"
#import "DetailViewController.h"
#import "UsersAPI.h"

@interface MainViewController () <UISearchResultsUpdating, UISearchBarDelegate>

@property NSArray<User*> *users;
@property NSArray<User*> *filteredUsers;

@property UISearchController *searchController;

@end

@implementation MainViewController

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.filteredUsers = [self.users copy];
    [self.tableView reloadData];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = [self.searchController.searchBar.text lowercaseString];
    
    if (searchText.length > 0) {
        self.filteredUsers = [self.filteredUsers filteredArrayUsingPredicate: [NSPredicate predicateWithBlock:^BOOL(id  _Nullable evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
            User *user = evaluatedObject;
            return [user.lastName containsString:searchText] || [user.firstName containsString:searchText];
        }]];
        
        [self.tableView reloadData];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UsersAPI *api = [[UsersAPI alloc] init];
    
    [api getUsersWithCompletion:^(NSArray<User *> *users) {
        self.users = users;
        self.filteredUsers = users.copy;
       
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    [self setupSearchController];
    
}

- (void) setupSearchController {
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = false;
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.delegate = self;
    self.definesPresentationContext = true;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredUsers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    User *user = self.filteredUsers[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", user.lastName, user.firstName];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    User *user = self.filteredUsers[indexPath.row];
    DetailViewController *dvc = [[DetailViewController alloc] init];
    dvc.user = user;
    [self showViewController:dvc sender:self];
}

@end

