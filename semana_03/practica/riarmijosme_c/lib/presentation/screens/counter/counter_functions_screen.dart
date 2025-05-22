import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contador con funciones"),
          actions: [
            IconButton(
                onPressed: () {
                  clickCounter = 0;
                  setState(() {});
                },
                icon: Icon(Icons.refresh)),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              '$clickCounter',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w300),
            )),
            Text(
              'Click${clickCounter == 1 ? '' : 's'}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            )
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(icono: Icons.plus_one, onPressed: (){
              clickCounter++;
              setState(() {
                
              });
            },),
            SizedBox(height: 10,),
            CustomButton(icono: Icons.refresh_outlined, onPressed: (){
              clickCounter=0;
              setState(() {
                
              });
            },),
            SizedBox(height: 10,),
            CustomButton(icono: Icons.exposure_plus_1_outlined, onPressed: (){
              clickCounter--;
              setState(() {
                
              });
            },),
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  
  final IconData icono;

  final VoidCallback? onPressed;
  
  const CustomButton({
    super.key, required this.icono, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.yellow,
      shape: StadiumBorder(),
      child: Icon(icono),
    );
  }
}
