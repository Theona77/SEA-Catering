# SEA Catering - Flutter Mobile App 🍽️

SEA Catering is a Flutter-based mobile application that allows users to subscribe to customizable healthy meal plans. The app supports features such as subscription forms, meal plan selection, promo sliders, and Firebase integration for data storage.

---

## 📱 Features

- Meal plan subscription with customizable options.
- Dynamic price calculation based on user input.
- Firebase Firestore integration for real-time database storage.
- Carousel slider for promotional banners.
- Form validation with user feedback.
- Admin-ready setup instructions.

---

## 🧰 Tech Stack

- **Flutter** (>=3.10.0)
- **Dart**
- **Firebase Firestore**
- **GetX** for state management and routing
- **Cloud Firestore** for backend
- **Carousel Slider** for image sliders

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

- Go to Firebase Console
- Create a new project (or use existing)
- Add an Android/iOS/Web app
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
- (Optional) Firebase Authentication if you add login features later

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

---

## ▶️ Admin Setup (Optional)

If you implement admin-specific screens or Firestore-based role control:
1. Go to [Firebase Console > Firestore > subscriptions]
2. Create a users collection.
3. Manually add a document with field:

```bash
{
  "email": "admin@seacatering.com",
  "role": "admin"
}
```

---

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

## 🧪 Testing
To run all tests:

```bash
flutter test
```

## 📝 License
This project is licensed under the MIT License. See the LICENSE file for details.
