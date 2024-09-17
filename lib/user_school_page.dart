import 'package:flutter/material.dart';
import 'yzu.dart'; // 確保你導入了yzu.dart

class UserSchoolPage extends StatelessWidget {
  const UserSchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '桃園市的大學',
          style: TextStyle(color: Colors.white), // 设置文字颜色为白色
        ),
        backgroundColor: Colors.cyan, // 将header设置为青色
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSchoolItem(context, '國立中央大學'),
          _buildSchoolItem(context, '中原大學'),
          _buildSchoolItem(context, '元智大學'),
          _buildSchoolItem(context, '長庚大學'),
          _buildSchoolItem(context, '銘傳大學'),
          _buildSchoolItem(context, '萬能科技大學'),
          _buildSchoolItem(context, '健行科技大學'),
          _buildSchoolItem(context, '中華大學桃園分部'),
        ],
      ),
    );
  }

  Widget _buildSchoolItem(BuildContext context, String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontSize: 18)),
        onTap: () {
          if (name == '元智大學') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const YzuPage()),
            );
          }
        },
      ),
    );
  }
}
