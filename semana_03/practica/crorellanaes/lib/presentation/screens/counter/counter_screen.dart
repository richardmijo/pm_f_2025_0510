import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const CounterScreen({
    super.key, 
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador simple"),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: widget.onToggleTheme,
              icon: Icon(
                widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                size: 18,
              ),
              label: Text(
                widget.isDarkMode ? 'Tema Claro' : 'Tema Oscuro',
                style: const TextStyle(fontSize: 12),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.isDarkMode 
                    ? Colors.orange[300] 
                    : Colors.indigo[900],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '$clickCounter',
              style: TextStyle(
                fontSize: 160, 
                fontWeight: FontWeight.w300,
                color: widget.isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ),
          Text(
            'Click${clickCounter == 1 ? '' : 's'}',
            style: TextStyle(
              fontSize: 25, 
              fontWeight: FontWeight.w300,
              color: widget.isDarkMode ? Colors.white70 : Colors.black54,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickCounter++;
          });
        },
        backgroundColor: widget.isDarkMode ? Colors.blueGrey[600] : Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 6,
        child: const Icon(
          Icons.plus_one,
          size: 28,
        ),
      ),
    );
  }
}