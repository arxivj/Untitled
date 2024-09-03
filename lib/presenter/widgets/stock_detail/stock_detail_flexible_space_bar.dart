import 'package:flutter/material.dart';

Widget StockDetailFlexibleSpaceBar(context) {
  return FlexibleSpaceBar(
    background: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          const SizedBox(height: 56),
          Row(
            children: [
              const SizedBox(width: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apple",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "AAPL",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: "  |  ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              TextSpan(
                                text: "NASDAQ",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "capital at risk",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                        BorderRadius.circular(50),
                      ),
                      // child: SvgPicture.asset(
                      //   "assets/icons/symbols/aapl.svg",
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                    WidgetStateProperty.resolveWith(
                          (states) {
                        return Colors.black;
                      },
                    ),
                    padding: WidgetStateProperty.resolveWith(
                          (states) {
                        return const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        );
                      },
                    ),
                    shape: MaterialStateProperty.resolveWith(
                          (states) {
                        return RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(100),
                        );
                      },
                    ),
                  ),
                  child: Text(
                    "Trade",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.resolveWith(
                          (states) {
                        return Colors.grey[200];
                      },
                    ),
                    padding: MaterialStateProperty.resolveWith(
                          (states) {
                        return const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        );
                      },
                    ),
                    shape: MaterialStateProperty.resolveWith(
                          (states) {
                        return RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(100),
                        );
                      },
                    ),
                  ),
                  child: Text(
                    "Watch",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}