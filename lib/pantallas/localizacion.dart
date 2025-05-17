import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Localizacion extends StatefulWidget{
  const Localizacion({super.key,required this.titulo});

  final String titulo;
  @override
  State<Localizacion> createState() => _LocalizacionState();

}

class _LocalizacionState extends State<Localizacion>{

  String _latitud="";
  String _longitud="";

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  void _obtenerCoordenadas() async{
    Position pos= await _determinePosition();
    setState(() {
      _latitud=pos.latitude.toString();
      _longitud=pos.longitude.toString();
    });
  }

  @override
  void initState(){
    super.initState();
  }
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Text("Localizacion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Localizacion",
              style: TextStyle
                (fontSize: 40,
              ),
            ),
            MaterialButton(
              shape: Border.all(
                color: Colors.black,
              ),
              color: Colors.greenAccent,
              onPressed:(){
                _obtenerCoordenadas();
              },
              child: Text("Obtener coordenadas",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Text(
                    "Latitud: $_latitud",
                    style: TextStyle
                      (fontSize: 32,
                    ),
                  )
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Text(
                    "Longitud: $_longitud",
                    style: TextStyle
                      (fontSize: 32,
                    ),
                  )
                ]
            ),
          ],
        ),
      ),
    );
  }
}