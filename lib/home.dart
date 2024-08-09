import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_on/app_color.dart';
import 'package:todo_on/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_on/tabs/settings_tab.dart';
import 'package:todo_on/tabs/tasks_tab.dart';


class Home extends StatefulWidget {
  static const String routeName="home";
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor:AppColor.secondary ,
        title: Text("ToDo App",style:
        TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context,
          isScrollControlled:true,
          builder: (context)=>Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AddTaskBottomSheet(),
          ),);
      },
        child: Icon(Icons.add,color:Colors.white),
        backgroundColor: AppColor.secondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color:Colors.white,width:4)
      ),),
      bottomNavigationBar:BottomAppBar(
        color: Colors.white,
        notchMargin: 8,
        padding:EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: AppColor.secondary,
          unselectedItemColor: AppColor.grey,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (value){
            selectedIndex=value;
            setState( (){});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "taskes".tr()),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "setting".tr()),
        
          ],),
      ),
      body:
      tabs[selectedIndex],

    );
  }
  List<Widget> tabs=[
    TasksTab(),
    SettingsTab()
  ];
}
