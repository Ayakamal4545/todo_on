import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_on/app_color.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("add_new_task".tr(),
          textAlign: TextAlign.center
          ,style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text("title".tr()),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18)),),
          ),
          SizedBox(
            height: 18,
          ),
          TextFormField(
            decoration: InputDecoration(
              label: Text("description".tr()),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18)),),
          ),
          SizedBox(
            height: 18,
          ),
          Text("select_time".tr(),style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400
          ),),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: (){
              selectDateFun();
            },
            child: Text(selectedDate.toString().substring(0,10),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 18,
          ),
          ElevatedButton(onPressed: (){},
              child: Text("add_task".tr(),style: TextStyle(
                  fontSize: 20,
                  color:Colors.white,
                  fontWeight: FontWeight.w400
              ),),style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.secondary
            ),)
        ],
      ),
    );
  }

  selectDateFun()async{
    DateTime? chosenDate=await showDatePicker(context: context,
        builder:(context,child)=>Theme(
          data:Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary:AppColor.secondary,
                  surface: AppColor.primary
            )
          ),
        child: child!,

        ),
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(chosenDate!= null){
      selectedDate=chosenDate;
      setState(() {

      });
    }
  }
}
