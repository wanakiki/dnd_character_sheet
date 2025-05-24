# dnd_character_sheet

A Dungeons & Dragons character sheet app built with Flutter. Designed to replace paper character sheets for easier management and added convenience during tabletop role-playing games.

![Screenshot](./screenshot/1028-4.png)


## TODO

- [x] Data persistence storage
- [x] Proficiency and corresponding advantage/disadvantage checks
- [ ] Campaign notes
- [x] Spellbook
- [x] Quick consumables bar
- [ ] Ability to assist in creating role cards

## How to Compile

To compile this project, ensure you have the following prerequisites:

1. **Flutter Version**: This project requires Flutter version `3.24.0`, Dart version `3.5.0`. You can check your Flutter version by running:
   ```bash
   flutter --version
   ```
   If you do not have the correct version, download it from [Flutter's official website](https://flutter.dev).

2. **Supported Platforms**: This project supports only **Android** and **iOS** platforms. Ensure you have the necessary SDKs and emulators/simulators set up for your platform.

### Steps to Compile

1. Clone the repository:
   ```bash
   git clone https://github.com/wanakiki/dnd_character_sheet
   cd dnd_character_sheet
   ```

2. Get the dependencies:
   ```bash
   flutter pub get
   ```

3. Compile for Android:
   ```bash
   flutter build apk
   ```

4. Compile for iOS (requires macOS and Xcode):
   ```bash
   flutter build ios
   ```

For more details, refer to the [Flutter documentation](https://flutter.dev/docs).

