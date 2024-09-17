import 'package:flutter/material.dart';

class MerchantRegisterPage5 extends StatefulWidget {
  const MerchantRegisterPage5({super.key});

  @override
  _MerchantRegisterPage5State createState() => _MerchantRegisterPage5State();
}

class _MerchantRegisterPage5State extends State<MerchantRegisterPage5> {
  String _verificationMethod = 'phone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('驗證'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              '選擇驗證方式',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              '我們必須確認你是這個商家的管理人。',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('電話驗證碼'),
              subtitle: const Text('透過簡訊或語音通話接收驗證碼: 0905 707 859'),
              leading: Radio<String>(
                value: 'phone',
                groupValue: _verificationMethod,
                onChanged: (String? value) {
                  setState(() {
                    _verificationMethod = value!;
                  });
                },
              ),
              trailing: const Icon(Icons.phone),
            ),
            ListTile(
              title: const Text('商家影片'),
              leading: Radio<String>(
                value: 'video',
                groupValue: _verificationMethod,
                onChanged: (String? value) {
                  setState(() {
                    _verificationMethod = value!;
                  });
                },
              ),
              trailing: const Icon(Icons.video_library),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // 處理稍後驗證邏輯
              },
              child: const Text(
                '稍後驗證',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 處理下一步邏輯
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('下一步'),
            ),
          ],
        ),
      ),
    );
  }
}
