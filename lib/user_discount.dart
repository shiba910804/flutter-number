import 'package:flutter/material.dart';

class UserDiscountPage extends StatelessWidget {
  const UserDiscountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '優惠活動',
          style: TextStyle(color: Colors.white), // 设置文字颜色为白色
        ),
        backgroundColor: Colors.cyan, // 将header设置为青色
        elevation: 0, // 去除阴影
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.local_offer),
                hintText: '輸入優惠序號',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '新增優惠',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildDiscountItem(
              title: '\$200 折扣優惠 XXXX',
              description: '請於2024年8月1日上午12時前使用\n適用特定XXXX商店。',
              onPressedAdd: () {
                // 新增優惠逻辑
              },
              onPressedDetail: () {
                // 查看詳細信息逻辑
              },
            ),
            const SizedBox(height: 10),
            _buildDiscountItem(
              title: '17% 折扣優惠（最多可折抵\$100）',
              description: '請於2024年8月1日上午12時前使用\n適用特定XXXX商店。',
              onPressedAdd: () {
                // 新增優惠逻辑
              },
              onPressedDetail: () {
                // 查看詳細信息逻辑
              },
            ),
            const SizedBox(height: 10),
            _buildDiscountItem(
              title: '15% 折扣優惠（最多可折抵\$80）',
              description: '請於2024年8月1日上午12時前使用\n適用所有商店。',
              onPressedAdd: () {
                // 新增優惠逻辑
              },
              onPressedDetail: () {
                // 查看詳細信息逻辑
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscountItem({
    required String title,
    required String description,
    required VoidCallback onPressedAdd,
    required VoidCallback onPressedDetail,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onPressedAdd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('新增優惠', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: onPressedDetail,
                child: const Text('詳細資訊', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
