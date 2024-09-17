import 'package:flutter/material.dart';

class MerchantPayPage extends StatelessWidget {
  const MerchantPayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '付費方案選擇',
          style: TextStyle(color: Colors.white), // 设置文字颜色为白色
        ),
        backgroundColor: Colors.cyan, // 将header设置为青色
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildPayOption(
            context,
            title: '客戶特徵辨識',
            description: '功能描述',
            price: 'US\$2.99 / 月',
          ),
          const SizedBox(height: 16),
          _buildPayOption(
            context,
            title: '人流分析',
            description: '記錄不同時間段的來訪數量\n分析高峰時段與離峰時段\n分析顧客停留時間\n如果有促銷活動\n分析活動對人流的影響',
            price: 'US\$2.99 / 月',
          ),
          const SizedBox(height: 16),
          _buildPayOption(
            context,
            title: '客群分析',
            description: '分析男女比例\n提供年齡層分佈\n顧客消費行為分析',
            price: 'US\$2.99 / 月',
          ),
          const SizedBox(height: 16),
          _buildPayOption(
            context,
            title: '一次訂閱三種',
            description: '訂閱所有功能，享有折扣優惠',
            price: 'US\$7.99 / 月',
          ),
        ],
      ),
    );
  }

  Widget _buildPayOption(
      BuildContext context, {
        required String title,
        required String description,
        required String price,
      }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.cyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            price,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // 处理订阅按钮点击事件
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.cyan,
            ),
            child: const Text('訂閱'),
          ),
        ],
      ),
    );
  }
}
