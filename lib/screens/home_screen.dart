import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/quotes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? quote;
  String? author;

  void generateQuote() {
    final random = Random();
    final randomQuote = quotes[random.nextInt(quotes.length)];

    setState(() {
      quote = randomQuote['quote'];
      author = randomQuote['author'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF020617), Color(0xFF0F172A)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 40),

                /// TITLE
                Text(
                  'Quotinator',
                  style: GoogleFonts.quicksand(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  'The Quote Generator',
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    color: const Color(0xFF94A3B8),
                  ),
                ),

                const Spacer(),

                /// QUOTE PANEL
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 26,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF020617),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: Text(
                              quote ?? 'Tap Generate to get a random quote',
                              key: ValueKey(quote),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          if (author != null) ...[
                            const SizedBox(height: 14),
                            Text(
                              '- $author',
                              style: GoogleFonts.quicksand(
                                fontSize: 13,
                                color: const Color(0xFF94A3B8),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    /// CORNER DECORATIONS
                    _corner(top: 0, left: 0),
                    _corner(top: 0, right: 0),
                    _corner(bottom: 0, left: 0),
                    _corner(bottom: 0, right: 0),
                  ],
                ),

                const Spacer(),

                /// BUTTON
                GestureDetector(
                  onTap: generateQuote,
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF020617),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          quote == null ? 'Generate' : 'Regenerate',
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      _corner(top: 0, left: 0),
                      _corner(top: 0, right: 0),
                      _corner(bottom: 0, left: 0),
                      _corner(bottom: 0, right: 0),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Decorative corner widget
  Widget _corner({double? top, double? bottom, double? left, double? right}) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          border: Border(
            top:
                top != null
                    ? const BorderSide(color: Color(0xFF94A3B8), width: 2)
                    : BorderSide.none,
            bottom:
                bottom != null
                    ? const BorderSide(color: Color(0xFF94A3B8), width: 2)
                    : BorderSide.none,
            left:
                left != null
                    ? const BorderSide(color: Color(0xFF94A3B8), width: 2)
                    : BorderSide.none,
            right:
                right != null
                    ? const BorderSide(color: Color(0xFF94A3B8), width: 2)
                    : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
