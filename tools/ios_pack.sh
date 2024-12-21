#!/bin/bash

# 设置变量
APP_NAME="Runner"
APP_PATH="build/ios/iphoneos/$APP_NAME.app"
IPA_NAME="$APP_NAME.ipa"
EXPORT_PATH="build/ios/iphoneos"


# 检查.app文件是否存在
if [ ! -d "$APP_PATH" ]; then
  echo "Error: $APP_PATH does not exist. Please build the app first."
  exit 1
fi

# 创建Payload目录并将.app文件复制进去
mkdir -p Payload
cp -r "$APP_PATH" Payload/

# 打包成IPA文件
zip -r "$IPA_NAME" Payload

# 清理Payload目录
rm -rf Payload

# 移动IPA文件到导出路径
mv "$IPA_NAME" "$EXPORT_PATH"