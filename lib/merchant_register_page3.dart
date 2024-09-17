import 'package:flutter/material.dart';
import 'merchant_register_page3_5.dart'; // 导入新创建的页面
import 'merchant_register_page4.dart'; // 导入新创建的页面

class MerchantRegisterPage3 extends StatefulWidget {
  const MerchantRegisterPage3({super.key});

  @override
  _MerchantRegisterPage3State createState() => _MerchantRegisterPage3State();
}

class _MerchantRegisterPage3State extends State<MerchantRegisterPage3> {
  bool? _providesDelivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('你是否提供外送或登門服務？'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              '例如來說，如果你提供到府或送貨服務，便可讓客戶知道你的服務範圍',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('是'),
              leading: Radio<bool>(
                value: true,
                groupValue: _providesDelivery,
                onChanged: (bool? value) {
                  setState(() {
                    _providesDelivery = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('否'),
              leading: Radio<bool>(
                value: false,
                groupValue: _providesDelivery,
                onChanged: (bool? value) {
                  setState(() {
                    _providesDelivery = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _providesDelivery != null
                  ? () {
                      if (_providesDelivery == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MerchantRegisterPage3_5()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MerchantRegisterPage4()),
                        );
                      }
                    }
                  : null,
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
