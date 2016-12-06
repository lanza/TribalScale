TODO:

* Implement paging so that upon a user scrolling past about 80% of the available content the application will load anohter set of data so that the scrolling will seem instantaneous.

* Implement a searchbar to enable users to search through the list of names to find the user they are looking for.
(I implemented this)

* Embed the `MainViewController` in a `UINavigationController`.

* Clean up the typing of variables in the project. As a developer that mostly uses Swift, I tend to assume type safety and type checking while writing code while ObjC is dynamic. I'd need to check the type and nil-ness of varaibles throughout the project to confirm they are indeed what I expect them to be. 

* Implement 3D touch peek & pop for selecting a user's name. A quick 3D touch peek would be more than sufficient for viewing simple user information instead of navigating to a separate view controller.

* You'd certainly want to clean up the UI and make the application much more presentable, but that would be more up to a designer's opinion.

* You'd need some sort of way of telling the user that the list of names is indeed being loaded, ie a `UIActivityView` spinner. 

* Error checking. If the network isn't available or the API call returns an error, you'd need to communicate the problem to the user.

* Give the user the option to sort the list of users in various ways. You could put a `UISegmentedControl` at the top and offer sort by first, last, age, etc.

* The displayed information is obviously very limited. Certainly an application such as this would have many more details to show regarding the users. Age, occupation, images etc. A custom `UITableViewCell` would be necessary to show this information in a neat and entertaining fashion. 

* A caching system would be useful if the data being displayed was consistent between restarts. IE if this list of users were for a list of employees at your company, the turnover would be very low. So you could use Realm or Core Data to cache the user list and only refresh it once every day or so. If the list changed completely every time you used it, a caching system would be useless. If the data changed at a rate in between these two extremes, you could load from Realm instantly and as the data came in you could update your `UITableView` to display the updated information.

* From a design pattern point of view, I've grown to be a fan of reactive programming and the coordinator pattern. We spoke briefly about reactive during the interview, but to reiterate: I'm a huge fan of using observers on the API call to handle the return of data instead of completion closures. The coordinator pattern exists to take navigation out of the hands of the view controllers and into the hands of a class designated for that purpose. I'm a fan of this separation of concerns.

* Use Swift in the Objective-C project for more unsafely typed situations like handling JSON data. It's a bit cumbersome to handle JSON in Swift, but the language makes it very clear at compile time (unlike ObjC which will fail during runtime) if you have any errors in your JSON logic. 

