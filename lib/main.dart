import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MaPage(),
    );
  }
}

class MaPage extends StatefulWidget {
  const MaPage({super.key});

  @override
  _MaPageState createState() => _MaPageState();
}

class _MaPageState extends State<MaPage> {
  List<String> villes = ['Sangmelima', 'Meyomessala', 'Zoetele', 'Avebe Esse'];
  String selectedVille = 'Sangmelima'; // ou toute autre valeur par défaut

  List<bool> isButtonPressed = [false, false, false, false];
  List<List<String>> buttonLabels = [
    ['Station Tradex', '7000XAF', 'Afamba', '237655223631'],
    ['Station 2', '6000XAF', 'Lieu 2', '123456789'],
    ['Station 3', '5000XAF', 'Lieu 3', '987654321'],
    ['Station 4', '4000XAF', 'Lieu 4', '456123789'],
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.menu,
              size: 48,
              color: Colors.orange,
            ),
            const SizedBox(height: 16),
            const Text(
              'Points de ventes',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tradex',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 200,
              height: 30,
              child: DropdownButtonFormField<String>(
                value: selectedVille,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedVille = newValue!;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.orange,
                ),
                isDense: true,
                isExpanded: true,
                items: villes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Text(value)),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 16),
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
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: isButtonPressed[index]
                              ? Colors.orange
                              : const Color.fromARGB(255, 238, 236, 236),
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
                              const SizedBox(height: 8),
                              Text(
                                buttonLabels[index][0],
                                style: const TextStyle(
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
                              const SizedBox(height: 8),
                              Text(
                                buttonLabels[index][1],
                                style: const TextStyle(
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
                              const SizedBox(height: 8),
                              Text(
                                buttonLabels[index][2],
                                style: const TextStyle(
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
                              const SizedBox(height: 8),
                              Text(
                                buttonLabels[index][3],
                                style: const TextStyle(
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
            const SizedBox(height: 4),
            Container(
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
  color: const Color.fromARGB(255, 241, 241, 241),
  width: 2, // Largeur de la bordure
),
              ),
            ),
            const SizedBox(height: 23),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  'Sélectionner',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
