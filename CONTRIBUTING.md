# Contributing
We are happy that you want to contribute to the VSL Catena app. We have some guidelines to make sure that the app stays consistent and that we can easily maintain it.

## Code style and conventions
As I am not completely familiar with the development of Flutter apps, I might have missed some conventions. If you notice something that is not in line with the conventions, please let me know.

### Architecture
We use Clean Architecture in the app. For more information about Clean Architecture, please read the [ARCHITECTURE.md](ARCHITECTURE.md) file.

### Merge requests
For merge requests, the pipeline is holy. If the pipeline fails, the merge request will not be merged. Except if there is a good reason for it, which should then be discussed within the merge request.

### Formatting
We use the dart formatter to format our code. You can run it with: `dart format .`
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


## TODO for iOS

### Configure Microsoft Login for iOS
https://firebase.google.com/docs/auth/flutter/federated-auth#microsoft