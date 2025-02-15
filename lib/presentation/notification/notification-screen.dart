import 'package:bst_staff_mobile/data/repository/notification-repository.dart';
import 'package:bst_staff_mobile/domain/model/notification-app.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/notification/notification-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

// Global ValueNotifier to hold count changes
final ValueNotifier<int> dataNotifier = ValueNotifier<int>(0);

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBarContent(
        title: 'แจ้งเตือน',
        valueListenable: dataNotifier,
      ),
      body: BaseBackground(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: MainColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: NotificationContent(dataNotifier: dataNotifier),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationContent extends StatefulWidget {
  final ValueNotifier<int> dataNotifier;
  const NotificationContent({super.key, required this.dataNotifier});

  @override
  _NotificationContentState createState() => _NotificationContentState();
}

class _NotificationContentState extends State<NotificationContent> {
  final ScrollController _scrollController = ScrollController();
  late NotificationModel _model;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _model = NotificationModel(
      log: Provider.of<Logger>(super.context, listen: false),
      notificationRepository:
          Provider.of<NotificationRepository>(super.context, listen: false),
      appService: Provider.of<AppService>(super.context, listen: false),
    );
    _model.addListener(_onModelChange);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _model.removeListener(_onModelChange);
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (_model.isMoreData()) {
        _model.loadData();
      }
    }
  }

  void _onModelChange() {
    if (_model.isLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        createLoadingSnackBar(),
      );
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NotificationModel>.value(
      value: _model,
      child: FutureBuilder<bool>(
        future: _model.initData(widget.dataNotifier),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data'));
          } else {
            return Consumer<NotificationModel>(
              builder: (context, model, child) {
                final notifications = model.notifications;
                if (notifications.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/empty_notification.png",
                        height: 200,
                      ),
                      const Text(
                        'ยังไม่มีแจ้งเตือน',
                        style: TextStyle(
                          fontSize: FontSizes.medium,
                          color: MainColors.primary300,
                        ),
                      ),
                    ],
                  );
                }

                return SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      ..._buildNotification(notifications),
                      if (_model.isLoading)
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                    ],
                    //children: [Text('AAA')],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildNotification(
    List<NotificationApp> notifications,
  ) {
    return notifications.map((value) {
      return GestureDetector(
        onTap: () {
          _model.updateAcknowledged(value.id);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          "assets/images/icon_notification.png",
                        ),
                        backgroundColor: MainColors.backgroundProfile,
                      ),
                      const SizedBox(width: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.msg,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            value.time,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            value.subdivisionName,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            value.timegone,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF9CA5BF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (!value.acknowledged)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFF0000),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
              const Divider(
                color: MainColors.divider,
                thickness: 0.6,
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
