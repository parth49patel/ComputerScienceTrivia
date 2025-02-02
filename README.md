# 🎉 Trivia App  

A **SwiftUI Trivia App** featuring smooth animations, interactive transitions, and dynamic difficulty filtering. The app provides a fun and engaging way to test knowledge across different categories and difficulty levels.  

## 🚀 Features  

### 📜 JSON Data & Codable  
- **Utilized JSON** for encoding and decoding trivia questions.  
- **Implemented `Codable`** to efficiently parse and manage JSON data.  

### 🎨 Dynamic UI with SwiftUI  
- **`LazyVGrid` Layout** → Displays multiple-choice options in an adaptive grid format.  
- **Custom Animations** → Smooth transitions and button interactions using `.animation` and `.transition`.  

### 🛠️ State Management & Filtering  
- **`@Published` Property Wrapper** → Tracks user selections and updates the UI dynamically.  
- **Filter by Difficulty** →  
  - Uses an **`enum`** to define difficulty levels: `Easy`, `Medium`, `Hard`, and `All`.  
  - The default selection is `"All"`, and users can change difficulty using `.onTapGesture`.  

### 📌 Custom Sheet for Views  
- **`.presentationDetents()`** → Implements a custom sheet modifier for displaying different views dynamically.   

## 🛠️ Technologies Used  
- **SwiftUI** for UI design  
- **Codable** for JSON parsing  
- **LazyVGrid** for efficient layout  
- **Animations & Transitions** for smooth user experience

## 📷 Screenshots  
(Coming up soon)  

## How to Run the Project  
1. Clone the repository:  
```diff
git clone https://github.com/parth49patel/ComputerScienceTrivia.git
```
2. Open the project in Xcode.
3. Run the app on a simulator or a real device.
