# VSL Catena App
The official app of V.S.L. Catena.

## Architecture
We use Clean Architecture in the app. This means that we have a clear separation between the different layers of the app where each layer has its own responsibility. The benefit of this is that the code is more maintainable and testable. It also makes it easier to change the code. If you want to change something in the data layer, you don't have to worry about the presentation layer as this only talks to the domain layer. This also applies to the presentation layer, which can be changed independently of the data layer.

The layers are:
- Domain
- Data
- Presentation

### Domain
The domain layer is the layer that dictates which business logic should exist in the app. It describes what is accessible by the other layers, and how it needs to be implemented. The domain layer is split up in three parts:
- Models
- Repositories
- Use cases

#### Models
The models are the classes that define the data that is used in the app. They are the classes that are used to pass data between the different layers.

#### Repositories
The repositories interfaces that define how data is retrieved and stored. They define the interface that is used by the use cases to retrieve and store data. Generally they are implemented by the data layer.

#### Use cases
The use cases are the classes that define the business logic accessible by the app. Through the use of the repositories, they can retrieve and store data. Most of the time they are used by the presentation layer, although they can also be used by the data layer.

### Data
The data layer is the layer that is responsible for the retrieval and storage of data. It contains all the code that is responsible for the communication with the backend. The data layer is split up in multiple parts:
- Repositories
- Data sources
- Models
- Mappers

#### Repositories
The repositories are the implementations of the repositories defined by the domain layer. They are responsible for the retrieval and storage of data. They use the data sources to retrieve and store data.

#### Data sources
The data sources are the classes that define how the data is retrieved and stored. This returns raw models, which should then be mapped to the domain models in the repositories through mappers. Both remote services (API endpoints) and local storage are data sources.

#### Models
The models are the objects that we receive from backend. These are raw objects that are not used by the rest of the app. They are used by the mappers to convert them to the models defined by the domain layer.

#### Mappers
The mappers are the classes that define how the models are converted to the models defined by the domain layer. They are used by the repositories to convert the data received from the data sources to the models defined by the domain layer.


### Presentation
The presentation layer is the layer that is closest to the user. It contains all the UI code.
The presentation layer is split up in two parts:
- App
- Pages

#### App
The app is the root of the presentation layer. It contains the code that is responsible for the navigation routing and the theming of the app. The routes consist of pages, which are the different screens of the app.

#### Pages
The pages are the different screens of the app. They contain the code that is responsible for the layout of the screen. They also contain the code that is responsible for the navigation between the different pages.

##### Blocs
The blocs are the classes that define the business logic of the presentation layer. They are used to separate the UI code from the business logic. They are used by the pages to retrieve and store data. They access this data through the use of the use cases in the domain layer.


## Code style and conventions
As I am not completely familiar with the development of Flutter apps, I might have missed some conventions. If you notice something that is not in line with the conventions, please let me know.

### Merge requests
For merge requests, the pipeline is holy. If the pipeline fails, the merge request will not be merged. Except if there is a good reason for it, which should then be discussed within the merge request.

### Formatting
We use the dart formatter to format our code. You can run it with:
`dart format .`
You can have opinions about the formatting, but dart format is almighty and shall not be questioned.

Most of the time when you have issues with the formatting you can easily fix it by trailing commas. Just add a comma here and there and try to run it again.

### Dependency Injection
We use GetIt for dependency injection. We use it to inject our repositories and use cases. Blocs will never be injected, but will be created by factories. This is because blocs have some underlying lifecycle handling that we don't want to interfere with. This also always gives us the ability to pass like a BuildContext to the bloc.

### Translations
We support Dutch and English. All translations are defined in presentation `lib/l10n`.

### Models
All models should have a constant constructor. All its parameters should be named parameters.

### Testing
We use triple A testing. Our goal is to have 100% test coverage.

## Requirements
These are required to already have installed to run the other commands:
- Node.js
- Dart
- Flutter

### Required installed globally
Tools for firebase:
`npm install -g firebase-tools`

More tools for firebase, but then for flutter (FlutterFire cli):
`flutter pub global activate flutterfire_cli`

To remove a lot of the burdens, we use some scripts using rps:
`dart pub global activate rps`

### Other requirements
You need to add your fingerprint to the firebase console. You can find the fingerprint by:
- Logging in into firebase by running `firebase login`
- Going to the folder of `app/android` and running `./gradlew signingReport`
- Copying the SHA1 and SHA256 fingerprint
- Going to the firebase console and adding both fingerprints to the app project settings
- Running `flutterfire configure`, also in the `app/android` folder

This should give you the ability to actually talk to firebase.

## Scripts
We have a couple of scripts to make our lives easier. All these commands are both available in the root, and in the different modules. If a certain command takes a long time to run, you can go into the module and run the command there.
### Build
`rps build`

### Generate code
`rps generate`
Things generated in the build command are required to run this command.

### When to use what
You should rerun `rps build` when you change things to:
- Dependency Injection

You should rerun `rps generate` when you change things to:
- Translations


## TODO for iOS

### Configure Microsoft Login for iOS
https://firebase.google.com/docs/auth/flutter/federated-auth#microsoft
