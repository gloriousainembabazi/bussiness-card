import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const BusinessCardApp());

class BusinessCardApp extends StatelessWidget {
  const BusinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00695C), Color(0xFF004D40)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // Profile Image
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/images/gloria.jpg'),
                  ),

                  const SizedBox(height: 20),

                  // Name
                  Text(
                    "Ainembabazi Glorious",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(1,1),
                          blurRadius: 4,
                          color: Colors.black38,
                        )
                      ],
                    ),
                  ),

                  // Job Title
                  Text(
                    "SOFTWARE DEVELOPER",
                    style: TextStyle(
                      color: Colors.tealAccent[100],
                      fontSize: 16,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 25),
                  Divider(color: Colors.white60, indent: 50, endIndent: 50, thickness: 1.2),

                  const SizedBox(height: 25),

                  // Contact Cards
                  _contactCard(Icons.phone, "+256 751120022"),
                  const SizedBox(height: 12),
                  _contactCard(Icons.email, "gloriousainembabazi16@gmail.com"),

                  const SizedBox(height: 30),

                  // 🔗 SOCIAL MEDIA ICONS HERE ↓
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(
                        icon: Icons.link,
                        label: "LinkedIn",
                        url: "https://www.linkedin.com/in/gloriousainembabazi",
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(width: 15),
                      _socialButton(
                        icon: Icons.sms, // close visual to X icon
                        label: "X / Twitter",
                        url: "https://x.com/gloriousainembabazi",
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _contactCard(IconData icon, String text) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 6,
      shadowColor: Colors.black45,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        child: Row(children: [
          Icon(icon, color: Colors.teal, size: 26),
          const SizedBox(width: 15),
          Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ]),
      ),
    );
  }

  // Social Button Widget
  Widget _socialButton({required IconData icon, required String label, required String url, required Color color}) {
    return ElevatedButton.icon(
      onPressed: () => _launchURL(url),
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }

  // Open URLs
  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not open $url");
    }
  }
}
