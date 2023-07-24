import 'package:shopfusion/imports.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});
  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  List<Map<String, dynamic>> settingModule = [
    {"title": "Update Profile", "icon": const Icon(Icons.person_outline)},
    {"title": "About", "icon": const Icon(Icons.info_outline)},
    {"title": "Log out", "icon": const Icon(Icons.logout_outlined)}
  ];
  String? selectedModule;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              margin: Constants.APP_PADDING_10,
              padding: Constants.APP_PADDING_10,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(33), border: Border.all(color: Colors.teal)),
              child: const Icon(Icons.person_2_outlined, size: 32, color: Colors.teal),
            ),
            Text("Admin", style: Themes.getTextStyleBoldMedium(context).copyWith(color: Colors.teal)),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: settingModule.length,
              itemBuilder: (context,index)=> Padding(
                padding: Constants.APP_PADDING_TOP_10,
                child: ListTile(
                
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                tileColor: Colors.teal.shade50,
                leading: settingModule[index]["icon"],
                title:   Text("${settingModule[index]["title"]}"),
                          ),
              ),),
            const SizedBox(height: 10),
            
          ],
        ),
      ),
    );
  }
}
