import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YzuPage extends StatelessWidget {
  const YzuPage({super.key});

  Future<void> _launchURL() async {
    const url = 'https://www.yzu.edu.tw/index.php/tw/';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '元智大學',
          style: TextStyle(color: Colors.white), // 设置文字颜色为白色
        ),
        backgroundColor: Colors.cyan, // 将header设置为青色
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              '地址',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '320桃園市中壢區遠東路135號',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              '學院',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. 工學院\n2. 商學院\n3. 人文社會學院\n4. 資訊學院\n5. 電機通訊學院',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              '網址',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _launchURL,
              child: const Text(
                'https://www.yzu.edu.tw/index.php/tw/',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '營業時間',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '週一 8:00~17:00\n週二 8:00~17:00\n週三 8:00~17:00\n週四 8:00~17:00\n週五 8:00~17:00\n週六 休息\n週日 休息',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              '聯繫方式',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '034638800',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
