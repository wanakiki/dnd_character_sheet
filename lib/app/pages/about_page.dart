import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatelessWidget {
  final String githubUrl = 'https://github.com/wanakiki/dnd_character_sheet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '功能介绍',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('这个APP设计之初的目的是为了避免跑团过程中对角色卡的频繁修改，并且能够方便地计算金钱金币以及快速查询法术。'
                '现在实现了自定义骰子、法术书功能，后续可能会导入魔法物品、专长等数据。'
                '现版本已经支持角色的导入和导出功能。'
                'APP的设计原则是尽可能避免权限申请，以保证软件的可靠性。'),
            const SizedBox(height: 16),
            const Text(
              '项目地址',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '这是一个开源的项目，项目地址：',
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: githubUrl));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('链接已复制到剪贴板')),
                );
              },
              child: Text(
                githubUrl,
                style: const TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '数据来源',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'APP中的法术数据来自于Excel半自动车卡工具，作者：太易，熊妈妈2D6。。',
            ),
            const SizedBox(height: 16),
            const Text(
              '最后',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '跑团对我来说，是“有想法就大胆去做”这句话最好的实践。',
            ),
          ],
        ),
      ),
    );
  }
}
