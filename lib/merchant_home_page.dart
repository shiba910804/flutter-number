import 'package:flutter/material.dart';
import 'merchant_start_page.dart'; // 确保你导入了merchant_start_page
import 'merchant_pay.dart'; // 确保你导入了merchant_pay.dart

class MerchantHomePage extends StatelessWidget {
  const MerchantHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '店家首頁',
          style: TextStyle(color: Colors.white), // 设置文字颜色为白色
        ),
        backgroundColor: Colors.cyan, // 将header设置为青色
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildListItem(context, '個人資料'),
          _buildListItem(context, '連接雲端'),
          _buildListItem(context, '連接資料庫'),
          _buildListItem(context, '客戶服務'),
          _buildListItem(context, '付費方案選擇', onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MerchantPayPage()),
            );
          }),
          _buildListItem(context, '設定'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '個人中心',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.cyan,
        onTap: (int index) {
          if (index == 0) {
            // 留在当前页面
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MerchantStartPage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String label, {VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(label),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap ?? () {
          // 处理列表项点击
        },
      ),
    );
  }
}
