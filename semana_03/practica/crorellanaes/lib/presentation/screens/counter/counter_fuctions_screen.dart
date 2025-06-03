import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;

  const CounterFunctionsScreen({
    super.key, 
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador con funciones"),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icono: Icons.plus_one,
            isDarkMode: widget.isDarkMode,
            onPressed: () {
              setState(() {
                clickCounter++;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icono: Icons.refresh_outlined,
            isDarkMode: widget.isDarkMode,
            onPressed: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          const SizedBox(height: 10),
          CustomButton(
            icono: Icons.exposure_minus_1_outlined,
            isDarkMode: widget.isDarkMode,
            onPressed: () {
              setState(() {
                if (clickCounter > 0) clickCounter--;
              });
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icono;
  final VoidCallback? onPressed;
  final bool isDarkMode;

  const CustomButton({
    super.key,
    required this.icono,
    required this.isDarkMode,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: isDarkMode ? Colors.blueGrey[600] : Colors.blue[600],
      foregroundColor: Colors.white,
      shape: const StadiumBorder(),
      elevation: 6,
      child: Icon(
        icono,
        size: 28,
      ),
    );
  }
}