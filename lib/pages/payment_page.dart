import 'package:flutter/material.dart';
import 'package:flutter_payment_app/component/colors.dart';
import 'package:flutter_payment_app/widgets/buttons.dart';
import 'package:flutter_payment_app/widgets/large_button.dart';
import 'package:get/get.dart';

import '../controllers/data_controllers.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    DataController controller = Get.find();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        height: h,
        width: w,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('images/paymentbackground.png'))),
        child: Column(
          children: [
            Container(
                width: double.maxFinite,
                height: h * 0.14,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('images/success.png'))),
                child: Container()),
            Text('Success !',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: AppColor.mainColor)),
            Text('Payment is completed for ${controller.newList.length} bills',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColor.idColor)),
            SizedBox(height: h * 0.045),
            Container(
              height: 178,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(width: 2, color: Colors.grey.withOpacity(0.5)),
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: ListView.builder(
                  itemCount: controller.newList.length,
                  itemBuilder: (_, index) {
                    return Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 15, left: 20, bottom: 10, right: 10),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.green),
                                child: Icon(Icons.done,
                                    size: 30, color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                width: 120,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.newList[index]['brand'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.mainColor),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                        'Id: ${controller.newList[index]['id']}',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.idColor))
                                  ],
                                ),
                              ),
                              SizedBox(width: 60),
                              Container(
                                  child: Text(
                                '\$${controller.newList[index]['due']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.mainColor),
                              ))
                            ],
                          ),
                          index != 2
                              ? Divider(
                                  thickness: 2,
                                  color: Colors.grey.withOpacity(0.5))
                              : Container()
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: h * 0.05),
            Column(
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(fontSize: 20, color: AppColor.idColor),
                ),
                SizedBox(height: 10),
                Text(
                  '\$${controller.totalDue}',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: AppColor.mainColor),
                )
              ],
            ),
            SizedBox(height: h * 0.14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButtons(icon: Icons.share, onTap: () {}, text: 'Share'),
                SizedBox(width: 80),
                AppButtons(icon: Icons.print, onTap: () {}, text: 'Print')
              ],
            ),
            SizedBox(height: h * 0.02),
            AppLargeButton(
                text: 'Done',
                backgroundColor: Colors.white,
                textColor: AppColor.mainColor,
                onTap: () {
                  Get.back();
                })
          ],
        ),
      ),
    );
  }
}
