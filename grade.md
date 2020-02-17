### Assignment 5 Grade

#### Model
| Points | Description |
| :--- | :--- |
| 1/1 | Reads data from `Data.plist` 
| 0.25/1 | Manages data in `DataManager` singleton pattern
| 1/1 | Uses `UserDefaults` for persistent storage

#### Custom Protocol
| Points | Description |
| :--- | :--- |
| 0/1 | Declares `PlacesFavoritesDelegate` protocol
| 0/1 | Defines and uses `delegate` variable in `FavoritesViewController`
| 0/1 | Conforms to protocol in `MapsViewController`
| 0/1 | Implements the `favoritePlace()` function that updates labels and zooms to favorite location
| 0/1 | Data is successfully send back

#### Adaptive Layout
| Points | Description |
| :--- | :--- |
| 0.25/1 | Map is full screen in all orientations and devices
| 0/1 | HUD view labels and stars are positioned using constraints
| 0/1 | HUD view height and width adjust to size class. Description label fills all vertical height.
| 0/1 | Favorites button vertical height is decreased in landscape.

#### MapViewController
| Points | Description |
| :--- | :--- |
| 1/1 | Initial region is Chicago
| 1/1 | Map view is muted style
| 1/1 | HUD has text labels and star button
| 0.25/1 | Star button toggles favorite state and shows selected/unselected fill
| 1/1 | "Favorites" button at bottom of screen modally presents `FavoritesViewController`

#### Map Annotations
| Points | Description |
| :--- | :--- |
| 1/1 | Annotations come from `Data.plist`
| 1/1 | Create `Place` subclass with `name` and `description` properties
| 1/1 | Create `PlaceMarkerView` custom annotation with _styling_
| 1/1 | Implement `didSelect()` method to receive touch and update the HUD view
| 1/1 | Annotations are places on the map in the correction location

#### FavoritesViewController
| Points | Description |
| :--- | :--- |
| 1/1 | Controller is presented modally
| 0/1 | `UITableView` shows the favorite places (no specific requirement on cell design)
| 0/1 | Contains a `UIButton` near the top of the controller to dismiss
| 0/1 | Table cell tap dismisses the view controller and passes data back using the protocol

#### Best Practices 
| Points | Description |
| :--- | :--- |
| 0.5/1 | Follows Swift and iOS best practices
| 1/1 | Uses separate files for new classes (eg. annotations, views, singletons, etc.)

#### Extra Credit
| Points | Description |
| :--- | :--- |
| 0/2 | Add local notification for when a user enters a region

#### Comments

-0.5 no app icon

-1 no PR

This project was submitted late. I will consider this the use of your extension for the quarter. If you would like to take another route, please let your instructor know.

It also looks like you ran out of time on functionality requirements. Please reach out to your instructor regarding the completion of assignments 3-5.

--------

You shouldn't ever show your user boilerplate code. When your app launches, they see "Title" in the HUB. Show them a message, or nothing at all.

Never ever hardcode arrays for your `for` loops (e.g. `for i in 0...12 {`). This is dangerous, and not dynamic.

Your `DataManager` should handle reading the `Data` file, not your view controller.

Delete unused and commented out code.

#### Grade
12.5/30
