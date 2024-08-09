import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_on/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import '../providers/my_provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String _selectedLanguage = 'english'.tr();
  final List<String> _languages = ['english'.tr(), 'arabic'.tr()];

  void _showSelectSheet(List<String> options, String currentValue, Function(String) onSelected) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
            color: AppColor.primary,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(options[index]),
                    leading: Radio<String>(
                      value: options[index],
                      groupValue: currentValue,
                      onChanged: (String? value) {
                        Navigator.pop(context);
                        onSelected(value!);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: pro.themeData.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('language'.tr()), // Use localization key
            ),
            InkWell(
              onTap: () => _showSelectSheet(_languages, _selectedLanguage, (value) {
                setState(() {
                  _selectedLanguage = value;
                  // Change the locale based on selected language
                  if (value == 'english'.tr()) {
                    context.setLocale(Locale('en'));
                  } else if (value == 'arabic'.tr()) {
                    context.setLocale(Locale('ar'));
                  }
                });
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.primary),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_selectedLanguage),
                    Icon(Icons.arrow_drop_down, color: AppColor.secondary),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('theme'.tr()), // Use localization key
            ),
            InkWell(
              onTap: () => _showSelectSheet(['light'.tr(), 'dark'.tr()], pro.themeMode == ThemeMode.light ? 'light'.tr() : 'dark'.tr(), (value) {
                setState(() {
                  pro.toggleTheme(value == 'dark'.tr());
                });
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(pro.themeMode == ThemeMode.light ? 'light'.tr() : 'dark'.tr(), style: const TextStyle(fontSize: 18)),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
