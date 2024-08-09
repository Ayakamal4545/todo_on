import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_on/app_color.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin:EdgeInsets.symmetric(horizontal: 12) ,
      //padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),

      ),

      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(),
            extentRatio: .7,
            children: [
              SlidableAction(onPressed: (context){},
                label: "delete".tr(),
                backgroundColor: Colors.red,
                icon:Icons.delete,
                spacing: 8,
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25)
                ),
              ),
              SlidableAction(onPressed: (context){},
                label: "edit".tr(),
                backgroundColor: Colors.blue,
                icon:Icons.edit,
                spacing: 8,

              ),
            ]),

        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                  color: AppColor.secondary,
                  borderRadius: BorderRadius.circular(25)
                ),

              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    Text("task_title".tr(),
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.secondary,
                      ),),
                    Text("task_description".tr(),
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.grey,
                    ),)
                  ],
                ),
              ),

              ElevatedButton(onPressed:(){},
                  child: Icon(Icons.done,color: Colors.white,size: 30,),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.secondary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
              )),
            ],
          ),
        ),
      ),
    );
  }
}
