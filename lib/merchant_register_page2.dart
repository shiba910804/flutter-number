import 'package:flutter/material.dart';
import 'merchant_register_page3.dart'; // 导入新创建的页面

class MerchantRegisterPage2 extends StatefulWidget {
  const MerchantRegisterPage2({super.key});

  @override
  _MerchantRegisterPage2State createState() => _MerchantRegisterPage2State();
}

class _MerchantRegisterPage2State extends State<MerchantRegisterPage2> {
  final TextEditingController _postalCodeController = TextEditingController();
  final TextEditingController _streetAddressController = TextEditingController();
  String? _selectedCountry = '台灣';
  String? _selectedCity;
  String? _selectedDistrict;

  final List<String> _countries = ['台灣'];
  final List<String> _cities = ['台北市', '新北市', '台中市', '台南市', '高雄市'];
  final Map<String, List<String>> _districts = {
    '台北市': ['中正區', '大同區', '中山區', '松山區', '大安區'],
    '新北市': ['板橋區', '中和區', '永和區', '新莊區', '三重區'],
    '台中市': ['中區', '東區', '南區', '西區', '北區'],
    '台南市': ['中西區', '東區', '南區', '北區', '安平區'],
    '高雄市': ['新興區', '前金區', '苓雅區', '鹽埕區', '鼓山區'],
  };

  @override
  void dispose() {
    _postalCodeController.dispose();
    _streetAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('輸入您的企業地址'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              '新增商家地點，讓客戶可以親臨你的商家',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              decoration: const InputDecoration(
                labelText: '國家/地區/區域',
                border: OutlineInputBorder(),
              ),
              items: _countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _postalCodeController,
              decoration: const InputDecoration(
                labelText: '郵遞區號',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedCity,
              decoration: const InputDecoration(
                labelText: '縣市',
                border: OutlineInputBorder(),
              ),
              items: _cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                  _selectedDistrict = null;
                });
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedDistrict,
              decoration: const InputDecoration(
                labelText: '鄉鎮市區',
                border: OutlineInputBorder(),
              ),
              items: _selectedCity != null
                  ? _districts[_selectedCity!]!.map((district) {
                      return DropdownMenuItem(
                        value: district,
                        child: Text(district),
                      );
                    }).toList()
                  : [],
              onChanged: (value) {
                setState(() {
                  _selectedDistrict = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _streetAddressController,
              decoration: const InputDecoration(
                labelText: '街道地址',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MerchantRegisterPage3()),
                );
              },
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
