import 'package:bst_staff_mobile/data/repository/refer-repository.dart';
import 'package:bst_staff_mobile/domain/model/refer.dart';
import 'package:bst_staff_mobile/domain/service/app_service.dart';
import 'package:bst_staff_mobile/presentation/refer/refer-model.dart';
import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:bst_staff_mobile/widget/appbar/base-appbar.dart';
import 'package:bst_staff_mobile/widget/background/base-background.dart';
import 'package:bst_staff_mobile/widget/common/custom-pagination.dart';
import 'package:bst_staff_mobile/widget/popup/dialog.dart';
import 'package:bst_staff_mobile/widget/refer/refer-card.dart';
import 'package:bst_staff_mobile/widget/refer/refer-search.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

final ValueNotifier<int> dataNotifier = ValueNotifier<int>(0);

class ReferScreen extends StatelessWidget {
  const ReferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: BaseAppBarContent(
        title: 'ส่งต่อ/รอรับ',
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
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: ReferContent(dataNotifier: dataNotifier),
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

class ReferContent extends StatefulWidget {
  final ValueNotifier<int> dataNotifier;
  const ReferContent({
    super.key,
    required this.dataNotifier,
  });

  @override
  _ReferContentState createState() => _ReferContentState();
}

class _ReferContentState extends State<ReferContent> {
  late final SenderModel _modelSender;
  late final ReceiverModel _modelReceiver;

  @override
  void initState() {
    super.initState();
    _modelSender = SenderModel(
      log: Provider.of<Logger>(context, listen: false),
      referRepository: Provider.of<ReferRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );

    _modelReceiver = ReceiverModel(
      log: Provider.of<Logger>(context, listen: false),
      referRepository: Provider.of<ReferRepository>(context, listen: false),
      appService: Provider.of<AppService>(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SenderModel>.value(value: _modelSender),
        ChangeNotifierProvider<ReceiverModel>.value(
          value: _modelReceiver,
        ),
      ],
      child: FutureBuilder<List<bool>>(
        future: Future.wait(
          [
            _modelSender.initData(),
            _modelReceiver.initData(widget.dataNotifier),
          ],
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('ไม่พบข้อมูล'));
          } else {
            return DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ReferSearch(
                      onValueChange: (value) async {
                        await _modelSender.searchByValue(value);
                        await _modelReceiver.searchByValue(value);
                      },
                    ),
                    TabBar(
                      isScrollable: true,
                      indicatorColor: MainColors.primary300,
                      tabAlignment: TabAlignment.start,
                      dividerColor: Colors.transparent,
                      labelColor: MainColors.primary500,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                      tabs: [
                        Consumer<SenderModel>(
                          builder: (context, model, child) {
                            return _buildTab(
                              "ส่งต่อ",
                              model.search.totalElements,
                            );
                          },
                        ),
                        Consumer<ReceiverModel>(
                          builder: (context, model, child) {
                            return _buildTab(
                              "รอรับ",
                              model.search.totalElements,
                            );
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildSender(),
                          _buildReceiver(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSender() {
    return Consumer<SenderModel>(
      builder: (context, model, child) {
        final sender = model.sender;
        return Stack(
          children: [
            if (sender.isEmpty) ...[
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'ไม่พบข้อมูล',
                      style: TextStyle(
                        color: MainColors.text,
                        fontSize: FontSizes.large,
                      ),
                    ),
                  ),
                ],
              ),
            ] else ...[
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Column(
                          children: [
                            ..._buildSenderCard(sender),
                          ],
                        ),
                      ),
                    ),
                    CustomPagination(
                      currentPage: model.search.page,
                      totalPages: model.search.totalPages,
                      goToPage: (page) async {
                        await model.loadData(page);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildReceiver() {
    return Consumer<ReceiverModel>(
      builder: (context, model, child) {
        final receiver = model.receiver;
        return Stack(
          children: [
            if (receiver.isEmpty) ...[
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'ไม่พบข้อมูล',
                      style: TextStyle(
                        color: MainColors.text,
                        fontSize: FontSizes.large,
                      ),
                    ),
                  ),
                ],
              ),
            ] else ...[
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Column(
                          children: [
                            ..._buildReceiverCard(receiver),
                          ],
                        ),
                      ),
                    ),
                    CustomPagination(
                      currentPage: model.search.page,
                      totalPages: model.search.totalPages,
                      goToPage: (page) async {
                        await model.loadData(page);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  List<Widget> _buildSenderCard(
    List<Sender> sender,
  ) {
    final List<Widget> senderCards = [];

    for (var i = 0; i < sender.length; i++) {
      senderCards.add(
        SenderCard(
          sender: sender[i],
          onclickRefer: (referFromId) {
            _onClickRefer(referFromId);
          },
        ),
      );

      if (i < sender.length - 1) {
        senderCards.add(const SizedBox(height: 16));
      }
    }

    return senderCards;
  }

  List<Widget> _buildReceiverCard(
    List<Receiver> receiver,
  ) {
    final List<Widget> receiverCards = [];

    for (var i = 0; i < receiver.length; i++) {
      receiverCards.add(
        ReceiverCard(
          receiver: receiver[i],
          onclickRefer: (referFromId) {
            _onClickRefer(referFromId);
          },
        ),
      );

      if (i < receiver.length - 1) {
        receiverCards.add(const SizedBox(height: 16));
      }
    }

    return receiverCards;
  }

  Future<void> _onClickRefer(int referFromId) async {
    try {} on Exception catch (e) {
      if (!context.mounted) return;

      await showInfoDialog(
        context: context,
        message: e.toString(),
      );
    }
  }
}

Widget _buildTab(String title, int? count) {
  return Tab(
    child: Row(
      children: [
        Text(title, style: const TextStyle(fontSize: FontSizes.small)),
        ...[
          const SizedBox(width: 4),
          _buildBadge(count ?? 0),
        ],
      ],
    ),
  );
}

Widget _buildBadge(int count) {
  return Container(
    width: 24,
    height: 24,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      shape: BoxShape.circle,
    ),
    child: Text(
      count.toString(),
      style: const TextStyle(
        fontSize: FontSizes.text,
        color: MainColors.text,
      ),
    ),
  );
}
