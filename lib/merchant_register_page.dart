import 'package:flutter/material.dart';
import 'merchant_register_page2.dart'; // 导入新创建的页面

class MerchantRegisterPage extends StatefulWidget {
  const MerchantRegisterPage({super.key});

  @override
  _MerchantRegisterPageState createState() => _MerchantRegisterPageState();
}

class _MerchantRegisterPageState extends State<MerchantRegisterPage> {
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _businessTypeController = TextEditingController();
  bool _termsAccepted = false;

  @override
  void dispose() {
    _shopNameController.dispose();
    _businessTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('開始建立商家檔案'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text(
              '這有助於你提高曝光度',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _shopNameController,
              decoration: const InputDecoration(
                labelText: '商家名稱*',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _businessTypeController,
              decoration: const InputDecoration(
                labelText: '業務類別*',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _termsAccepted,
                  onChanged: (bool? value) {
                    setState(() {
                      _termsAccepted = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Wrap(
                    children: [
                      const Text('繼續即表示你同意這些 '),
                      GestureDetector(
                        onTap: () {
                          // 打开服務條款页面
                        },
                        child: const Text(
                          '《服務條款》',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const Text(' 和 '),
                      GestureDetector(
                        onTap: () {
                          // 打开隱私權政策页面
                        },
                        child: const Text(
                          '《隱私權政策》',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _termsAccepted
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MerchantRegisterPage2()),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              child: const Text('下一步'),
            ),
          ],
        ),
      ),
    );
  }
}
