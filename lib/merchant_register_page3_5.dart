import 'package:flutter/material.dart';
import 'merchant_register_page4.dart'; // 导入下一页

class MerchantRegisterPage3_5 extends StatefulWidget {
  const MerchantRegisterPage3_5({super.key});

  @override
  _MerchantRegisterPage3_5State createState() => _MerchantRegisterPage3_5State();
}

class _MerchantRegisterPage3_5State extends State<MerchantRegisterPage3_5> {
  final TextEditingController _serviceAreaController = TextEditingController();

  @override
  void dispose() {
    _serviceAreaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新增服務範圍 (選填)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              '新增貴商家提供外送或登門服務的區域。這項資訊會顯示在你的商家檔案上。',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _serviceAreaController,
              decoration: const InputDecoration(
                labelText: '搜尋並選取範圍',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MerchantRegisterPage4()),
                );
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
