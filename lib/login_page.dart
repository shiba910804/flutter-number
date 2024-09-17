import 'package:flutter/material.dart';
import 'user_login_page.dart';
import 'merchant_login_page.dart'; // 确保你创建并导入了店家登录页面

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景图片
          Positioned.fill(
            child: Image.asset(
              'assets/images/sss.jpg',  // 确保路径正确
              fit: BoxFit.cover,
            ),
          ),
          // 透明层
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // 内容
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                // 标题
                Text(
                  '登入',
                  style: TextStyle(
                    fontFamily: 'Cursive', // 确保你有这个字体
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                // 描述文字
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    '選擇你的身份',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                // 使用者登录按钮
                Column(
                  children: [
                    IconButton(
                      iconSize: 100,
                      icon: const Icon(Icons.person, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const UserLoginPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '使用者',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // 店家登录按钮
                Column(
                  children: [
                    IconButton(
                      iconSize: 100,
                      icon: const Icon(Icons.store, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MerchantLoginPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '店家',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
