- 在界面上面放一组骰子，点击骰子之后上面的数值会发生变化，提供快速的鉴定方案
- 检查骰子袋新版UI的逻辑是否有问题
- 考虑兼职的情况下 熟练加值的计算方式
- 临时生命值更好的修改方式


flutter pub run build_runner build

flutter build apk --release
adb install build/app/outputs/flutter-apk/app-release.apk


生成图标 flutter pub run flutter_launcher_icons:main

更换名称和图标 
https://juejin.cn/post/7220688635142455356

骰子图标
https://pixabay.com/zh/vectors/d20-dice-game-nat20-dnd-d-d-7136921/


open ios/Runner.xcworkspace
flutter build ios --release