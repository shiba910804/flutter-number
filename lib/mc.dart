import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the Provider package
import 'reservation_notifier.dart'; // Import the ReservationNotifier

class McPage extends StatelessWidget {
  const McPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationNotifier = Provider.of<ReservationNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '麥當勞-環中東二餐廳',
          style: TextStyle(color: Colors.white), // 设置文字颜色为白色
        ),
        backgroundColor: Colors.cyan, // 将header设置为青色
        actions: [
          IconButton(
            icon: const Icon(Icons.event_available),
            onPressed: () {
              reservationNotifier.makeReservation('mc');
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('預約成功!'),
                  content: Text('你的號碼是${reservationNotifier.getReservationNumber('mc')}號'),
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
            Image.asset('assets/images/mcmenu.jpg'), // 确保图片路径正确
            const SizedBox(height: 20),
            const Text(
              '營業時間',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '星期一至星期日\n24小時營業',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              '聯繫方式',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '電話: 034559117',
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
                '當前號碼: ${reservationNotifier.getReservationNumber('mc')}',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                '等候時間: ${reservationNotifier.getEstimatedWaitingTime('mc')} 分鐘',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
