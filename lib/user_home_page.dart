import 'package:flutter/material.dart';
import 'user_userdata.dart';
import 'abiko.dart'; // 確保你已經導入了abiko.dart
import 'mc.dart'; // 导入麦当劳页面

import 'package:provider/provider.dart'; // Import the Provider package
import 'reservation_notifier.dart'; // 確保你已經導入了reservation_notifier.dart

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0; // To keep track of the selected bottom nav item
  String? selectedCategory; // Initialize with null to show all stores by default

// 篩選商店的getter，現在包括基於搜索文本的過濾功能
List<Map<String, dynamic>> get filteredStores => stores.where((store) {
  final searchQuery = _searchController.text.toLowerCase();
  return store['name'].toLowerCase().contains(searchQuery);
}).toList();

  // List of categories and their respective icons
  final List<Map<String, dynamic>> categories = [
    {'name': '餐廳', 'icon': Icons.fastfood},
    {'name': '超市', 'icon': Icons.local_grocery_store},
    {'name': '學校', 'icon': Icons.school},
    {'name': '便利商店', 'icon': Icons.store},
    {'name': '藥局', 'icon': Icons.local_pharmacy},
    {'name': '美妝店', 'icon': Icons.face},
    {'name': '寵物用品店', 'icon': Icons.pets},
    {'name': '花市', 'icon': Icons.local_florist},
    {'name': '百貨商場', 'icon': Icons.shopping_bag},
    {'name': '電子產品', 'icon': Icons.electrical_services},
  ];

  // Store data with categories
  final List<Map<String, dynamic>> stores = [
    {'name': '我孫子Abiko', 'image': 'assets/images/1.jpg', 'category': '餐廳'},
    {'name': '美廉社 中壢興仁店', 'image': 'assets/images/2.jpg', 'category': '超市'},
    {'name': '元智大學', 'image': 'assets/images/3.jpg', 'category': '學校'},
    {'name': '7-ELEVEN 興榮珍門市', 'image': 'assets/images/4.jpg', 'category': '便利商店'},
    {'name': '裕翔藥局', 'image': 'assets/images/5.jpg', 'category': '藥局'},
    {'name': '寶雅 中壢環中店', 'image': 'assets/images/6.jpg', 'category': '美妝店'},
    {'name': '寵物公園(內壢文化店)', 'image': 'assets/images/7.jpg', 'category': '寵物用品店'},
    {'name': '9號花舖 / No.9 Florist', 'image': 'assets/images/8.jpg', 'category': '花市'},
    {'name': '遠東SOGO 中壢店', 'image': 'assets/images/9.jpg', 'category': '百貨商場'},
    {'name': '全國電子 中壢內壢門市', 'image': 'assets/images/10.jpg', 'category': '電子產品'},
    {'name': '麥當勞-中壢環中東二餐廳', 'image': 'assets/images/11.jpg', 'category': '餐廳'},
    // Add more stores if needed
  ];

  @override
  Widget build(BuildContext context) {
    final reservationNotifier = Provider.of<ReservationNotifier>(context);
    bool showReservationInfo = reservationNotifier.hasAnyReservations();
    final filteredStores = selectedCategory == null
        ? stores
        : stores.where((store) => store['category'] == selectedCategory).toList();

    // ... Your existing build method code here, with conditional BottomAppBar rendering ...

    return Scaffold(
      appBar: AppBar(
        title: const Text('服務'),
        backgroundColor: Colors.cyan,
        
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '搜索店家',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => setState(() {}), // 這裡使用setState來觸發UI更新
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (value) => setState(() {}), // 文本變更時觸發重建UI
            ),
          ),
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedCategory == categories[index]['name']) {
                        selectedCategory = null;
                      } else {
                        selectedCategory = categories[index]['name'];
                      }
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(categories[index]['icon'], size: 40),
                        Text(categories[index]['name']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('店家總覽', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: filteredStores.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (filteredStores[index]['name'] == '我孫子Abiko') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AbikoPage()),
                      );
                    } else if (filteredStores[index]['name'] == '麥當勞-中壢環中東二餐廳') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const McPage()),
                      );
                    }
                    // Add navigation for other stores if needed
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            filteredStores[index]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(filteredStores[index]['name']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (showReservationInfo)
          BottomAppBar(
            color: Colors.cyan,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Ensure padding is suitable
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center, // Center content in the available space
                  children: [
                    if (reservationNotifier.hasReservations("abiko")) ...[
                      Text(
                        '我孫子號碼牌: ${reservationNotifier.getReservationNumber("abiko")}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        '我孫子等候時間: ${reservationNotifier.getEstimatedWaitingTime("abiko")} 分鐘',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                    if (reservationNotifier.hasReservations("mc")) ...[
                      Text(
                        '麥當勞號碼牌: ${reservationNotifier.getReservationNumber("mc")}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        '麥當勞等候時間: ${reservationNotifier.getEstimatedWaitingTime("mc")} 分鐘',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '主畫面',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '個人資料',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UserUserdataPage()),
        );
        break;
      // Additional cases for other tabs
    }
  }
}
