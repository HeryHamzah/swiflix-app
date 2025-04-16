
# Swiflix
![GitHub epo size](https://img.shields.io/github/repo-size/HeryHamzah/swiflix-app)
![GitHub contributors](https://img.shields.io/github/contributors/HeryHamzah/swiflix-app)
![GitHub stars](https://img.shields.io/github/stars/HeryHamzah/swiflix-app?style=social)
![GitHub forks](https://img.shields.io/github/forks/HeryHamzah/swiflix-app?style=social)

Swiflix is a cinema ticket booking simulation app built with SwiftUI, following the principles of Clean Architecture and the MVVM pattern. It uses Firebase for authentication and data storage, and integrates with The Movie Database (TMDb) API to display the latest movie information.


![App Screenshot](https://res.cloudinary.com/dleqqywhr/image/upload/v1744799282/swiflix-mockup_zl8gwx.png)

## Prerequisites
Before you begin, ensure you have met the following requirements:
- Got a themoviedb.org account for getting a API key. Please make an account if you haven't got any
## Installation

To install Swiflix, follow these steps:

1. Clone the repo
    ```sh
   git clone https://github.com/HeryHamzah/swiflix-app.git
   ```

2. Setup Firebase:
- Go to Firebase Console
- Create a new project and register your iOS app
- Download GoogleService-Info.plist and add it to the Xcode project
- Enable Authentication (Email/Password) and Firestore Database

3. Setup TMDb API:
- Register at [The Movie Database](https://www.themoviedb.org/)
- Get your API Key and Access Token
- Open Data/Movie/MovieConstants.swift and set:
     ```sh
    static let API_KEY = "YOUR TMDB API KEY"
    static let ACCESS_TOKEN = "YOUR ACCESS TOKEN"
   ```

4. Setup Firebase Storage Bucket
- Copy your Storage bucket name from Firebase project settings
- Open Data/DataConstants.swift and set:
     ```sh
    static let FirebaseBucketName = "YOUR FIREBASE BUCKET NAME" //example: gs://swiflix-2aa3b.appspot.com
   ```
   
5. Run the app using a simulator or physical iOS device.


## License

This project is built for educational and simulation purposes. All movie-related content is sourced from The Movie Database ([TMDb](https://www.themoviedb.org/)).


## Contact
Feel free to reach out for any feedback or collaboration:
- 📧 Email: herymobiledev@gmail.com
- 💼 LinkedIn: [Hery Hamzah](https://www.linkedin.com/in/heryyhamzah)
