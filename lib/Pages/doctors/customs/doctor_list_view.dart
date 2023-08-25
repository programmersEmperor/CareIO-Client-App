import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      padding: EdgeInsets.only(top: 10.sp),
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          child: Card(
            elevation: 15.sp,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp)),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 12.sp, right: 12.sp, top: 5.sp, bottom: 10.sp),
              child: Row(
                children: [
                  Container(
                    height: 40.sp,
                    width: 40.sp,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            width: 3.sp),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/person.jpg"),
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8.0.sp, right: 5.0.sp, top: 13.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Doctor name",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.5.sp),
                            child: Text(
                              "Specialization",
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.5.sp),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  "3.4",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
