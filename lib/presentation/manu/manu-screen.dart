import 'package:bst_staff_mobile/presentation/appointment/appointment-screen.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/manu/manu.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:flutter/material.dart';

class ManuScreen extends StatelessWidget {
  const ManuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.primary500,
      appBar: const BaseAppBarMain(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: const ManuContent(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ManuContent extends StatefulWidget {
  const ManuContent({super.key});

  @override
  State<ManuContent> createState() => _ManuContentState();
}

class _ManuContentState extends State<ManuContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                "เมนูทั้งหมด",
                style: TextStyle(
                  fontSize: FontSizes.medium,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          children: [
            AppointmentMenu(
              onTap: (id) => _onHandleItem(
                id,
              ),
            ),
            PatientMenu(
              onTap: (id) => _onHandleItem(
                id,
              ),
            ),
            HelpMenu(
              onTap: (id) => _onHandleItem(
                id,
              ),
            ),
            CertificateMenu(
              onTap: (id) => _onHandleItem(
                id,
              ),
            ),
            ForwardMenu(
              onTap: (id) => _onHandleItem(
                id,
              ),
            ),
            DashboardMenu(
              onTap: (id) => _onHandleItem(
                id,
              ),
            ),
            SettingUserMenu(
              onTap: (id) => _onHandleItem(
                id,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _onHandleItem(int id) async {
    try {
      if (id == 1) {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppointmentScreen(),
          ),
        );
      } else if (id == 2) {
        print("Clicked ID: $id for another menu item.");
      }
    } on Exception catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}
