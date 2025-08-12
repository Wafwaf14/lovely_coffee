# ☕ Lovely Coffee - Flutter Coffee Shop App

A beautiful and interactive coffee shop mobile application built with Flutter, featuring liquid swipe animations and a realistic coffee ordering experience.

## 📱 Screenshots

![App Demo](assets/demo.mp4)


## ✨ Features

### 🎨 **Stunning UI/UX**
- **Liquid Swipe Animation** - Smooth transitions between pages using liquid_swipe package
- **Material Design 3** - Modern and clean interface
- **Gradient Backgrounds** - Category-specific color schemes
- **Custom Animations** - Handwriting text animation on welcome screen

### ☕ **Coffee Shop Experience**
- **3 Coffee Categories**: Ice Coffee, Espresso, Hot Coffee
- **16+ Coffee Varieties** with detailed descriptions and pricing
- **Realistic Customization**:
  - Size selection (Small, Medium, Large)
  - Sugar level control (0-5 levels)
  - Milk options (Regular, Almond, Oat, Coconut, Soy)
  - Decaf options where available
  - Quantity selector

### 🛒 **Shopping Features**
- **Add to Cart** functionality
- **Dynamic Pricing** based on size and milk choices
- **Premium Options** with upcharge pricing
- **Favorites** system (like/unlike items)

### 🏗️ **Architecture**
- **MVVM Pattern** - Clean separation of concerns
- **Widget-based Architecture** - Reusable UI components
- **Model Classes** - Structured data management
- **Navigation System** - Bottom navigation with liquid swipe integration

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart (>=3.0.0)
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/lovely-coffee-app.git
   cd lovely-coffee-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Add your assets**
   - Place coffee images in `assets/` folder
   - Update `pubspec.yaml` with your asset paths

4. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── data/
│   └── coffee_data.dart           # Static coffee data
├── models/
│   ├── coffee_category_model.dart # Category model
│   ├── coffee_item_model.dart     # Individual coffee item model
│   └── cart_item_model.dart       # Shopping cart model
├── widgets/
│   ├── liquid_swipe_widget.dart   # Reusable liquid swipe component
│   ├── welcome_page_widget.dart   # Welcome screen
│   ├── coffee_category_page_widget.dart # Category display
│   ├── coffee_item_card_widget.dart # Individual coffee cards
│   ├── bottom_navigation_widget.dart # Navigation bar
│   ├── brew_page_widget.dart      # Brewing guide page
│   └── profile_page_widget.dart   # User profile page
├── views/
│   └── home_page.dart             # Main application entry
└── main.dart                      # App initialization
```

## 🎯 Key Features Breakdown

### **Liquid Swipe Navigation**
- Seamless page transitions with liquid wave effects
- Integration with bottom navigation for quick access
- Gesture-based navigation between coffee categories

### **Coffee Customization System**
- **Size Pricing**: Small (+$0), Medium (+$0.50), Large (+$0.75)
- **Premium Milk**: Oat/Almond milk (+$0.60 upcharge)
- **Sugar Levels**: 6 levels from "No Sugar" to "Very Sweet"
- **Decaf Options**: Available for most espresso-based drinks

### **Data Management**
- Structured data models for scalability
- Easy addition of new coffee categories and items
- Flexible pricing system with automatic calculations

## 🛠️ Technologies Used

### **Flutter Packages**
- `flutter/material.dart` - Material Design components
- `liquid_swipe` - Liquid swipe page transitions
- `provider` (optional) - State management

### **Architecture Patterns**
- **MVVM** - Model-View-ViewModel pattern
- **Widget Composition** - Reusable UI components
- **Separation of Concerns** - Clean code organization

### **Typography**
- **Headers**: Bold, 24-36px
- **Body Text**: Regular, 14-16px
- **Captions**: Light, 12px

## 📈 Future Enhancements

- [ ] **User Authentication** - Login/Register system
- [ ] **Real Shopping Cart** - Persistent cart with checkout
- [ ] **Payment Integration** - Stripe/PayPal integration
- [ ] **Order Tracking** - Real-time order status
- [ ] **Loyalty Program** - Points and rewards system
- [ ] **Store Locator** - Find nearby coffee shops
- [ ] **Reviews & Ratings** - User feedback system
- [ ] **Push Notifications** - Order updates and promotions

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
## 🙏 Acknowledgments

- **liquid_swipe package** - For amazing page transitions
- **Flutter team** - For the incredible framework
- **Material Design** - For design guidelines
- **Coffee enthusiasts** - For inspiration ☕

---

### 📱 Download & Try

*Add download links when app is published*

---

**Made with ❤️ and lots of ☕**
