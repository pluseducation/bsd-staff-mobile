import 'package:bst_staff_mobile/theme/font-size.dart';
import 'package:bst_staff_mobile/theme/main-colors.dart';
import 'package:flutter/material.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) goToPage;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.goToPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Previous Button
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 16,
            ),
            onPressed:
                (currentPage + 1) > 1 ? () => goToPage(currentPage - 1) : null,
          ),

          ...buildPageNumbers(),

          // Next Button
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onPressed: (currentPage + 1) < totalPages
                ? () => goToPage(currentPage + 1)
                : null,
          ),
        ],
      ),
    );
  }

  List<Widget> buildPageNumbers() {
    final List<Widget> pages = [];
    final currentPage = this.currentPage + 1;

    // First pages (1-4)
    for (int i = 1; i <= 4 && i <= totalPages; i++) {
      pages.add(buildlPageButton(currentPage, i));
    }

    // Add "..." if needed
    if (currentPage + 1 > 5 && totalPages > 6) {
      pages.add(const Text("..."));
    }

    // Show middle pages dynamically
    if (currentPage >= 5 && currentPage <= totalPages - 3) {
      pages.add(buildlPageButton(currentPage, currentPage));
    }

    // Add "..." if nearing the end but not at the last few pages
    if (currentPage < totalPages - 3 && totalPages > 6) {
      pages.add(const Text("..."));
    }

    // Last page
    if (totalPages > 4) {
      pages.add(buildlPageButton(currentPage, totalPages));
    }

    return pages;
  }

  Widget buildlPageButton(int currentPage, int page) {
    return GestureDetector(
      onTap: () => goToPage(page),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: currentPage == page
              ? MainColors.primary500
              : MainColors.secondaryLight,
          shape: BoxShape.circle,
        ),
        child: Center(
          // Center the text inside the circle
          child: Text(
            "$page",
            style: TextStyle(
              color: currentPage == page ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: FontSizes.medium,
            ),
          ),
        ),
      ),
    );
  }
}
