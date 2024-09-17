// 在某個頁面，例如 AbikoPage

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'reservation_notifier.dart'; // 引入狀態管理類別

class AbikoPage extends StatelessWidget {
  const AbikoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationNotifier = Provider.of<ReservationNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '我孫子Abiko',
          style: TextStyle(color: Colors.white), // 设置文字颜色为白色
        ),
        backgroundColor: Colors.cyan, // 将header设置为青色
        actions: [
          IconButton(
            icon: const Icon(Icons.event_available),
            onPressed: () {
              reservationNotifier.makeReservation('abiko');
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    title: const Text('預約成功!'),
                    content: Text('你的號碼是${reservationNotifier.getReservationNumber('abiko')}號'),
                     actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('確認'),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '菜單',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Image.asset('assets/images/S__73375854.jpg'), // 确保图片路径正确
            const SizedBox(height: 20),
            const Text(
              '營業時間',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '星期一\n11:30–14:30\n17:00–20:30\n\n'
              '星期二\n11:30–14:30\n17:00–20:30\n\n'
              '星期三\n11:30–14:30\n17:00–20:30\n\n'
              '星期四\n11:30–14:30\n17:00–20:30\n\n'
              '星期五\n11:30–14:30\n17:00–20:30\n\n'
              '星期六\n休息\n\n'
              '星期日\n11:30–14:30\n17:00–20:30',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              '聯繫方式',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '032853135',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '當前號碼: ${reservationNotifier.getReservationNumber('abiko')}',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                '等候時間: ${reservationNotifier.getEstimatedWaitingTime('abiko')} 分鐘',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
