# Flutter Authentication Process DEMO [Android]

## FLUTTER X FIREBASE

## - Firebase setup

When it comes to authentication, a common practice in Software development is to build a full authentication process
from scratch.<br/>
But we can also use a BAAS to achieve that in order to save time.<br/>
Firebase is a Backend As A Service maintained by Google, It provides us a reliable way to build a full operating
authentication system in our application.<br/>

Here is how to use it.

### Required flutter dependencies

- firebase_core
- fireabse_auth

### Requirements:

1. In the `<flutter_project>/android` folder, run `./gradlew sigingReport`, copy the `SHA1` and `SHA-256` keys printed, you must add them to your firebase project in order to use some Firebase services like [phone number authentication](https://firebase.google.com/docs/auth/flutter/phone-auth?hl=fr#:~:text=Phone%20authentication%20allows%20users%20to,able%20to%20sign%20into%20Firebase.)


2. **Create a new Firebase project**: ([Guide](https://cloud.google.com/firestore/docs/client/get-firebase?hl=fr)) remember to add the keys


3. Copy and paste the downloaded `google-services.json` file (from step 2) in `<flutter_project>/android/app`


4. **Firebase CLI**: Follow this [link](https://firebase.google.com/docs/cli?hl=fr#mac-linux-npm) if you don't know how to
   do it, Once you're logged in, next step


5. **run `dart pub global activate flutterfire_cli`**  in order to install and activate the Flutterfire CLI


6. **To configure your Firebase X Flutter project**, move inside your Flutter project and run <br/>
   `flutterfire configure` (
   learn [more](https://firebase.google.com/docs/flutter/setup?hl=fr&platform=ios#configure-firebase))


7. And that's all you need to use Firebase as your backend authentication service...