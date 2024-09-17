import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_discount.dart'; // 確保你已經導入了user_discount.dart
import 'user_qrcode.dart'; // 確保你已經導入了user_qrcode.dart
import 'user_loveres.dart'; // 確保你已經導入了user_loveres.dart
import 'reservation_notifier.dart'; // 確保你已經導入了reservation_notifier.dart

class UserUserdataPage extends StatelessWidget {
  const UserUserdataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationNotifier = Provider.of<ReservationNotifier>(context);
    bool showReservationInfo = reservationNotifier.hasAnyReservations(); // 檢查是否有預約

    return Scaffold(
      appBar: AppBar(
        title: const Text('個人資料'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '張博閎',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildFeatureButton(context, '最愛商家', Icons.favorite, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserLoveresPage()),
                  );
                }),
                _buildFeatureButton(context, '錢包', Icons.account_balance_wallet, () {}),
                _buildFeatureButton(context, '訂單', Icons.receipt_long, () {}),
              ],
            ),
            const SizedBox(height: 20),
            _buildBanner(context, '智慧排隊通 Plus', '無廣告、智慧推薦\n享受更好的AI小助手與更多優惠'),
            ListTile(
              leading: const Icon(Icons.qr_code_scanner),
              title: const Text('掃描QRcode'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserQRCodePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_offer),
              title: const Text('輸入優惠碼'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserDiscountPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('隱私設定'),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: showReservationInfo ? BottomAppBar(
        color: Colors.cyan,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (reservationNotifier.hasReservations("abiko"))
                  Text(
                    '我孫子號碼牌: ${reservationNotifier.getReservationNumber("abiko")}',
                    style: const TextStyle(color: Colors.white),
                  ),
                if (reservationNotifier.hasReservations("abiko"))
                  Text(
                    '我孫子等候時間: ${reservationNotifier.getEstimatedWaitingTime("abiko")} 分鐘',
                    style: const TextStyle(color: Colors.white),
                  ),
                if (reservationNotifier.hasReservations("mc"))
                  Text(
                    '麥當勞號碼牌: ${reservationNotifier.getReservationNumber("mc")}',
                    style: const TextStyle(color: Colors.white),
                  ),
                if (reservationNotifier.hasReservations("mc"))
                  Text(
                    '麥當勞等候時間: ${reservationNotifier.getEstimatedWaitingTime("mc")} 分鐘',
                    style: const TextStyle(color: Colors.white),
                  ),
              ],
            ),
          ),
        ),
      ) : null,
    );
  }

  Widget _buildFeatureButton(BuildContext context, String label, IconData icon, VoidCallback onPressed) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _buildBanner(BuildContext context, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, size: 40, color: Colors.amber),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(subtitle),
            ],
          ),
        ],
      ),
    );
  }
}
