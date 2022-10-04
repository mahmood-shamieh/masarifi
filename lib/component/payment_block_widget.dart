import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:masarifi/component/edit_payment_dialog.dart';
import 'package:masarifi/constants.dart';
import 'package:masarifi/controllers/View_controllers/main_page_controller.dart';
import 'package:masarifi/models/db_models/payment_model.dart';

class PaymentBlockWidget extends GetView<MainPageController> {
  PaymentModel paymentModel;

  PaymentBlockWidget({super.key, required this.paymentModel});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.defaultDialog(
            title: "الوصف",
            titleStyle: getTextStyle(
              size: 20,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            content: RichText(
              text: TextSpan(
                text: paymentModel.note,
                style: getTextStyle(
                  size: 20,
                  color: Get.theme.primaryColor,
                ),
              ),
            ),
          ),
          leading: Icon(Icons.payment),
          trailing: IconButton(
            onPressed: () => Get.defaultDialog(
                title: "تعديل",
                titleStyle: getTextStyle(
                  size: 20,
                  color: Get.theme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                content: EditPaymentDialog(
                  paymentModel: paymentModel,
                )),
            icon: Icon(Icons.edit),
          ),
          title: RichText(
            text: TextSpan(
              text: paymentModel.price.toString(),
              style: getTextStyle(
                size: 20,
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          subtitle: RichText(
            text: TextSpan(
              text:
                  controller.getCategoryName(id: paymentModel.category_id ?? 0),
              style: getTextStyle(
                  size: 20,
                  color: Get.theme.primaryColor,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: RichText(
                text: TextSpan(
                  text: paymentModel.time_stamp.toString(),
                  style: getTextStyle(
                    size: 20,
                    color: Get.theme.primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
