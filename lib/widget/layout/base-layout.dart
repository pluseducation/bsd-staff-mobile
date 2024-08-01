import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BaseLayoutScrollView extends StatelessWidget {
  final Widget child;

  const BaseLayoutScrollView({required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: child,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class BaseLayoutPadding extends StatelessWidget {
  final Widget child;

  const BaseLayoutPadding({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: child,
    );
  }
}

class BaseLayout extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const BaseLayout({
    required this.maxWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class BaseLayouts extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const BaseLayouts({
    required this.maxWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }
}

class BaseLayoutScrollViewPading extends StatelessWidget {
  final Widget child;

  const BaseLayoutScrollViewPading({required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        Container(
          padding: const EdgeInsets.all(20.0),
          child: child,
        ),
      ],
    );
  }
}
