import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MaPage(),
    );
  }
}

class MaPage extends StatefulWidget {
  @override
  _MaPageState createState() => _MaPageState();
}

class _MaPageState extends State<MaPage> {
  List<String> villes = ['Sangmelima', 'Meyomessala', 'Zoetele', 'Avebe Esse'];
  String selectedVille = 'Sangmelima'; // ou toute autre valeur par défaut

  List<bool> isButtonPressed = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.menu,
              size: 48,
              color: Colors.orange,
            ),
            SizedBox(height: 16),
            Text(
              'Points de ventes',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Tradex',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 200, // Définir une largeur personnalisée
              height: 30,
              child: DropdownButtonFormField<String>(
                value: selectedVille,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedVille = newValue!;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.orange), // Bordure orange
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.orange), // Bordure lorsqu'en focus
                  ),
                ),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.orange,
                ),
                isDense: true, // Réduire la taille du widget
                isExpanded: true, // Centrer les éléments
                items: villes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Text(value)), // Centrer le texte
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 4),
            Expanded(
              child: Container(
                width: 400,
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: 16),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          for (int i = 0; i < isButtonPressed.length; i++) {
                            if (i == index) {
                              isButtonPressed[i] = !isButtonPressed[i];
                            } else {
                              isButtonPressed[i] = false;
                            }
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        decoration: BoxDecoration(
                          color: isButtonPressed[index]
                              ? Colors.orange
                              : Colors.grey[200],
                          border: Border.all(
                            color: isButtonPressed[index]
                                ? Colors.orange
                                : Color.fromARGB(255, 238, 236, 236),
                            width: 2, // Largeur de la bordure
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'icons/depotGaz.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Station Tradex',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'icons/prix.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '7000XAF',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'icons/position.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Afamba',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'icons/whatsapp.png',
                                  width: 50,
                                  height: 50,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  '237655223631',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
