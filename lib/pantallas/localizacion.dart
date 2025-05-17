import 'package:frankie/pantallas/principal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Localizacion extends StatefulWidget{
  const Localizacion({super.key, required this.titulo});

  final String titulo;


  @override
  State<Localizacion> createState() => _LocalizacionState();

}

class _LocalizacionState extends State<Localizacion> {

  TextEditingController _controller = TextEditingController();

  Future<SharedPreferences> _obtenerPreferencias() async{
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  Future<void> _escribirDatos() async{
    SharedPreferences _prefs=await _obtenerPreferencias();
    await _prefs.setString("Kevin", _controller.text);
  }


  List<Widget> _pantallas=[];
  Widget _cuerpo=MyHomePage(title: "HOLA QUE HACES");

  @override
  void initState(){
    super.initState();
    //_controller.text="Ingresa algo";
  }
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Text("SOY LA Localizacion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Localizacion", style: TextStyle(fontSize: 40,
            ),
            ),
            MaterialButton(onPressed: (){
              print("Obtener localizaion");
            },

            ),

            SizedBox(
              width: 400,
              child: TextField(
                controller: _controller,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                ),

              ),

            ),



            SizedBox(
              height: 25,
            ),

            MaterialButton(
              onPressed: ()async{
                await _escribirDatos();
                //print(_controller.text);
                _controller.text="";
                //widget.funcionCambio(1);

              },
              color: Theme.of(context).colorScheme.inversePrimary,
              child: Text("ENVIAR", style: TextStyle(fontSize: 40,
              ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}