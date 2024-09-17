// lib/merchant_start_page.dart

import 'package:flutter/material.dart';
import 'merchant_home_page.dart'; // 確保你導入了 merchant_home_page

class MerchantStartPage extends StatelessWidget {
  const MerchantStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '個人中心',
          style: TextStyle(color: Colors.white), // 設置文字顏色為白色
        ),
        backgroundColor: Colors.cyan, // 將header設置為青色
      ),
      body: Container(
        color: Colors.white, // 將body背景設置為白色
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildGridButton(context, '客戶特徵辨識', Icons.face, null),
            const SizedBox(height: 20),
            _buildGridButton(context, '人流分析', Icons.people, null),
            const SizedBox(height: 20),
            _buildGridButton(context, '客群分析', Icons.analytics, null),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.cyan,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MerchantHomePage()),
            );
          } else if (index == 1) {
            // 跳轉到設定頁面
          }
        },
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String label, IconData icon, Widget? page) {
    return Container(
      width: double.infinity,
      height: 100,

      child: ElevatedButton(
        onPressed: () {
          if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // 背景顏色
          foregroundColor: Colors.black, // 文字顏色
          padding: const EdgeInsets.all(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
