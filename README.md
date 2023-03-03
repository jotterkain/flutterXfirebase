# Flutter Authentication Process DEMO [Android]

## FLUTTER X FIREBASE

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

1. In the `<flutter_project>/android` folder, run `./gradlew sigingReport`, copy the `SHA1` and `SHA-256` key printed, you must add them to your firebase project in order to use some services like `phone number authentication` 


2. **Create a new Firebase project**: ([How to](https://cloud.google.com/firestore/docs/client/get-firebase?hl=fr)) remember to add the keys


3. Copy and paste the downloaded `google-services.json` file (from step 1) in `<flutter_project>/android/app`


4. **Make sure to add google and firebase dependencies for android**: <br/><br/>

   1. file: `<flutter_project>/android/build.gradle`
   
   ```gradle
    buildscript {
        repositories {
            // Make sure that you have the following two repositories
            google()  // Google's Maven repository
            mavenCentral()  // Maven Central repository
        }
        dependencies {
            ...
            // Add the dependency for the Google services Gradle plugin
            classpath 'com.google.gms:google-services:4.3.15'
        }
    }
   
    allprojects {
        ...
        repositories {
            // Make sure that you have the following two repositories
            google()  // Google's Maven repository
            mavenCentral()  // Maven Central repository
        }
    }
    ```
   
   2. file: `<flutter_project>/android/app/build.gradle`
      
   ```gradle
    plugins {
       id 'com.android.application'
        // Add the Google services Gradle plugin
        id 'com.google.gms.google-services' 
        ...
    }
                
     dependencies {
        // Import the Firebase BoM
        implementation platform('com.google.firebase:firebase-bom:31.2.2')
        
        // When using the BoM, don't specify versions in Firebase dependencies
        // https://firebase.google.com/docs/android/setup#available-libraries
     }
     ```
5. **Firebase CLI**: Follow this [link](https://firebase.google.com/docs/cli?hl=fr#mac-linux-npm) if you don't know how to
   do it, Once you're logged in, next step


6. **run `dart pub global activate flutterfire_cli`**  in order to install and activate the Flutterfire CLI


7. **To configure your Firebase X Flutter project**, move inside your Flutter project and <br/>
   `flutterfire configure` (
   learn [more](https://firebase.google.com/docs/flutter/setup?hl=fr&platform=ios#configure-firebase))


8. And that's all you need to use Firebase as your backend authentication service...
















