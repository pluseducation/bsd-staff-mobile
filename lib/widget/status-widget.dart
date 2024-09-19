import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

Widget patientStatusWidget(String status) {
  String text = "";
  Color lightColor;
  Color color;

  if (status == "REGISTERING") {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "ลงทะเบียน";
  } else if (status == "SCREENING") {
    lightColor = MainColors.warningLight;
    color = MainColors.warning;
    text = "คัดกรอง";
  } else if (status == "TREATMENT") {
    lightColor = MainColors.infoLight;
    color = MainColors.info;
    text = "บำบัด";
  } else if (status == "MONITORING") {
    lightColor = MainColors.successLight;
    color = MainColors.success;
    text = "ติดตาม";
  } else if (status == "ASSISTANCE") {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "ช่วยเหลือ";
  } else if (status == "DISCHARGED") {
    lightColor = MainColors.errorLight;
    color = MainColors.error;
    text = "จำหน่าย";
  } else {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "ลงทะเบียน";
  }

  return Container(
    width: 100,
    padding: const EdgeInsets.all(8.0), // Padding inside the Chip
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget mentalEvalLevelWidget(String status) {
  Color lightColor;
  Color color;
  String text;

  if (status == "NORMAL") {
    lightColor = const Color(0xFFEEFFF4);
    color = const Color(0xFF3CA468);
    text = "ไม่มีอาการ";
  } else if (status == "SEMI_URGENCY") {
    lightColor = const Color(0xFFFFFAED);
    color = const Color(0xFFF2994B);
    text = "กึ่งเร่งด่วน";
  } else if (status == "URGENCY") {
    lightColor = const Color(0xFFFFF0E5);
    color = const Color(0xFFFE6805);
    text = "เร่งด่วน";
  } else if (status == "MONITORING") {
    lightColor = const Color(0xFFFBE9E9);
    color = const Color(0xFFD82E22);
    text = "ฉุกเฉิน";
  } else {
    return const SizedBox.shrink();
  }

  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget certificateStatusWidget(String status) {
  Color lightColor = MainColors.secondaryLight;
  Color color;
  String text;

  if (status == "REQUEST") {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "รายการขอ";
  } else if (status == "COMPLETED") {
    lightColor = Color(0xFFdbf5ee);
    color = Color(0xFF4cceac);
    text = "ออกใบรับรอง";
  } else {
    lightColor = MainColors.secondaryLight;
    color = MainColors.secondary;
    text = "";
  }

  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget mentalEvalLevelResultWidget(String status) {
  Color lightColor;
  Color color;
  String title;
  String description;

  if (status == "NORMAL") {
    lightColor = const Color(0xFFfff0e5);
    color = const Color(0xFF3CA468);
    title = "ไม่มีอาการ";
    description = "";
  } else if (status == "SEMI_URGENCY") {
    lightColor = const Color(0xFFfff0e5);
    color = const Color(0xFFF2994B);
    title = "กึ่งเร่งด่วน (Semi-Urgency)";
    description =
        "หมายถึง ผู้ป่วยมีพฤติกรรมก้าวร้าวรุนแรง ที่ยังสามารถรับฟังคำเตือนแล้วสงบลงได้ ซึ่งจะถูกจัดอยู่ในกลุ่มปานกลาง ต้องจัดการภายใน 24 ชั่วโมง";
  } else if (status == "URGENCY") {
    lightColor = const Color(0xFFfff0e5);
    color = const Color(0xFFFE6805);
    title = "เร่งด่วน (Urgency)";
    description =
        "หมายถึง ผู้ป่วยมีพฤติกรรมก้าวร้าวรุนแรง ที่เริ่มควบคุมตนเองไม่ได้ มีท่าที่ที่อาจะเกิดอันตรายต่อตนเอง ผู้อื่น และทรัพทย์สิน ซึ่งจะถูกจัดอยู่ในกลุ่มหนัก ต้องจัดการภายใน 2 ชั่วโมง";
  } else if (status == "EMERGENCY") {
    lightColor = const Color(0xFFfff0e5);
    color = const Color(0xFFD82E22);
    title = "ฉุกเฉิน (Emergency)";
    description =
        "หมายถึง ผู้ป่วยมีพฤติกรรมก้าวร้าวรุนแรง ที่ไม่สามารถควบคุมตนเองได้ จนเกิดอันตรายต่อตนเอง หรือผู้อื่น หรือทรัพย์สิน ซึ่งจะถูกจัดอยู่ในกลุ่มหนักมาก ต้องจัดการทันทีทันใด";
  } else {
    return const SizedBox.shrink();
  }

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "สรุปผล",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(description),
      ],
    ),
  );
}

Widget drugEvalScrollResultWidget(
  int drugEvalScore,
  String levelOfAddicted,
  String screeningResult,
) {
  Color lightColor;
  Color color;
  String title;
  String levelOfAddictedText = "";
  String description;

  if (screeningResult == "USER") {
    lightColor = const Color(0XFFFFF6F6);
    color = MainColors.black;
    title = "ผู้ใช้ (user, กลุ่มเสี่ยงต่ำ)";
  } else if (screeningResult == "ABUSE") {
    lightColor = const Color(0XFFFFF6F6);
    color = const Color(0xFFffbd59);
    title = "ผู้เสพ (abuse, กลุ่มเสี่ยงปานกลาง)";
  } else if (screeningResult == "DEPENDENCE") {
    lightColor = const Color(0XFFFFF6F6);
    color = const Color(0xFFdb4f4a);
    title = "ผู้ติด (dependence, กลุ่มเสี่ยงสูง)";
  } else {
    return const SizedBox.shrink();
  }

  if (levelOfAddicted == "NORMAL") {
    levelOfAddictedText = "ต่ำ";
  } else if (levelOfAddicted == "MEDIUM") {
    levelOfAddictedText = "ปานกลาง";
  } else if (levelOfAddicted == "HIGH") {
    levelOfAddictedText = "สูง";
  }

  return Container(
    padding: const EdgeInsets.all(8.0),
    width: double.infinity,
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Wrap(
      spacing: 16.0, // Horizontal space between children
      runSpacing: 8.0, // Vertical space between lines

      children: [
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the left
          children: [
            const Text(
              "รวมคะแนนที่ได้",
            ),
            const SizedBox(height: 8.0),
            Text(
              drugEvalScore.toString(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the left
          children: [
            const Text(
              "ระดับผลกระทบจากการใช้",
            ),
            const SizedBox(height: 8.0),
            Text(
              levelOfAddictedText,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the left
          children: [
            const Text(
              "ผลการคัดกรอง",
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18, color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );
}
