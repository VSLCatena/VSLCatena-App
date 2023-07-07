# VSL Catena App
The official app of V.S.L. Catena.

## Contributing
For more information about contributing, please read the [CONTRIBUTING.md](CONTRIBUTING.md) file.

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

Temporarily (until we have written the cloud functions to do this for us), you need to add some data to the firestore database to make the app work:
- Add yourself in the members collection, the id must be your microsoft account's uuid. Look at an other member to see what fields you need to add.
- Check what your firebase's user uid is in firebase authentication, and add a document in the users collection with that uid. In there you need to add a field called `memberId` with the value of your microsoft account's uuid.

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