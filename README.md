# adaptive_card_layout

CardView is a versatile SwiftUI component for displaying a collection of views in a card-like format. It supports both grid and horizontal scrolling layouts and includes optional scaling effects 

#features
- Display views in a grid or horizontal scrolling layout.
- Optional scaling effect for views based on their position .
- Can display views in carousel format with optional scaling
- Customizable view dimensions and spacing .
- Accepts an array of content views

  Horizontal scroll
- Display cards in carousel 
- Change the number of rows as per requirement
- Based on the number rows selected the the content in the array gets adjusted
- Add scaling effect

<img width="251" alt="Screenshot 2024-07-09 at 6 40 04 PM" src="https://github.com/softsuave-tech-matrix/adaptive_card_layout/assets/139471661/14ad15a0-780f-4bf1-a3a6-c1ae7983c2c9">
<img width="250" alt="Screenshot 2024-07-09 at 6 40 41 PM" src="https://github.com/softsuave-tech-matrix/adaptive_card_layout/assets/139471661/6c03de0e-3bca-4c5c-a9d0-8345b7090d66">
<img width="242" alt="Screenshot 2024-07-09 at 6 41 07 PM" src="https://github.com/softsuave-tech-matrix/adaptive_card_layout/assets/139471661/113f0a2e-7fe4-4b98-ab3d-be940f96c142">

Vertical scroll view : 
- Display cards in a grid
- Change the number of columns as per the requirement
- Based on the number of columns selected the content of the array gets adjusted

<img width="263" alt="Screenshot 2024-07-09 at 6 41 43 PM" src="https://github.com/softsuave-tech-matrix/adaptive_card_layout/assets/139471661/4d642ef8-27e4-4788-a664-107bcf9e7bba">
<img width="255" alt="Screenshot 2024-07-09 at 6 42 06 PM" src="https://github.com/softsuave-tech-matrix/adaptive_card_layout/assets/139471661/227c436a-3a8d-459d-befc-fba58b7326fc">

- Change the frame width as per your requirement
<img width="263" alt="Screenshot 2024-07-09 at 6 42 29 PM" src="https://github.com/softsuave-tech-matrix/adaptive_card_layout/assets/139471661/834dac49-faac-4c7e-8368-e9fb80f0cfdd">

#properties
viewsArray: [Binding<[AnyView]>] - An array of views to be displayed.
gridView: Binding<Bool> - Whether to display the views in a grid layout or carousel format(horizontal scrolling)
scale: Bool - Whether to apply a scaling effect. Default is false.
scaleFactor: CGFloat - Adjust the amount of scaling as per your requirement. Default is 1.1
frameWidth: CGFloat - The width of each view. Default is 150.
frameHeight: CGFloat - The height of each view. Default is 150.
additionalFrameHeight: CGFloat - Additional height given to the view for horizontal scrolling to avoid overlapping or breaking of view. Default is 30  
RowOrColumnNo: Binding<Int> - The number of columns required in the grid layout or the number of rows required for the horizontal scrolling layout .
verticalSpacing: vertical spacing between the cards. Default is 10. 
horizontalSpacing: Horizontal spacing between the cards. Default is 10.
onTap: ((Int) -> Void)? - An optional closure to handle tap gestures on the views.

#installation
- Add the package through swift package manager to your project
- Alternatively you can also install through coco pods



