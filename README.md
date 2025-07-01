# SEA Catering - Flutter Mobile App 🍽️

SEA Catering is a Flutter-based mobile application that allows users to subscribe to customizable healthy meal plans. The app supports features such as subscription forms, meal plan selections, admin dasboard, product showcases, add to cart, products checkout, products payment, wishlist, AI chatbox, and Firebase integration for database and authentications. 

---

## 📱 Features

- Meal plan subscription with customizable options. 
- Dynamic price calculation based on user input both in subscription and checkout.
- Firebase Firestore integration for real-time database storage.
- Edit address, profile picture, subscriptions information
- Review system by submitting testimonials from different users
- Carousel slider for promotional banners, foods, and experience.
- Form validation with user feedback.
- Add to cart by pressing the product, product will be shown in cart Icon
- Search the name of product
- View all product and Filtering the products
- Wish List the product with heart icon and can view it in Navigation User
- Login and Register authentication with firebase using Email
- AI Chatbox at homepage for help
- User dashboard and Admin Dashboard
- Light and Dark Mode View Screen


---

## 🧰 Tech Stack

- **Flutter** ^3.7.2 using **Dart** Language
- **Firebase Firestore Database and Firebase Authentication**
- **GetX** for state management and routing
- **Cloud Firestore** for backend
- **Carousel Slider** for image sliders
- **Lottie** for animated illustrations
- **Cached Network** Image for optimized image loading
- **fl_chart** for charts and data visualization

---

## 🚀 Getting Started

Follow these steps to run the project locally on your machine.

### 1. Clone the repository

```bash
git clone https://github.com/your-username/sea-catering-app.git
cd sea-catering-app
```


### 2. Install dependencies

```bash
flutter pub get
```


### 3. Install dependencies

#### 🔐 Add your Firebase config:

- Go to Firebase Console (https://console.firebase.google.com/)
- Create a new project (or use existing) and Fill necessary data
- At the page of "Get started by adding Firebase to your app", Press Flutter Icon and follow the instructions
- After following instructions, You should have added firebase to your app
- If not:
### Path
Make sure the path (bin) is in your enviroment variables

### Integration
Integrate Firebase into 'main.dart' by adding the 'firebase_core' package in pubspec.yaml and integrate Firebase into your 'main.dart' file. 

- Go back to overview, Add an Android/iOS/Web app
- Download the config file and place it in the correct location:

#### For Android:

```bash
/android/app/google-services.json
```

#### For iOS:

```bash
/ios/Runner/GoogleService-Info.plist
```

#### Make sure you enable:
- Firestore Database
- Firebase Authentication

### GENERATE SHA-1 & SHA-256
▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
#### Mac 
```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

#### Windows
```bash
keytool -list -v -keystore "\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
```

#### Linux 
```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

### 4. Environment Variables
Create a .env file (optional) for storing private keys or API URLs (if used).
Example:

```bash
FIREBASE_API_KEY=your_firebase_api_key
```
📝 Note: This app currently uses Firebase config files directly. Environment variables are optional unless using .env + flutter_dotenv.

---

## ▶️ Running the App

```bash
flutter run
```


```bash
flutter run -d android   # or ios / windows / chrome
```

## 📂 Project Structure

```bash
lib/
├── features/
│   ├── shop/
│   └── subscription/
├── common/
│   ├── widgets/
│   └── utils/
├── main.dart
├── subscription.dart
```

## 📸 Screenshots
<img width="1317" alt="Frame 9" src="https://github.com/user-attachments/assets/d817a2d2-a72b-45f2-9a39-24561f8949c0" />
<img width="1317" alt="Frame 10" src="https://github.com/user-attachments/assets/7cee613a-ce74-45a1-83a8-374adc064ecf" />


## 🧪 Testing
To run all tests:

```bash
flutter test
```

## 📝 License
This project is licensed under the MIT License. See the LICENSE file for details.
