import 'package:flutter/material.dart';

class TampilData extends StatelessWidget {
  final String nama;
  final String nim;
  final String tahunLahir;

  TampilData({required this.nama, required this.nim, required this.tahunLahir});

  @override
  Widget build(BuildContext context) {
    // Hitung umur
    int tahunLahirInt = int.tryParse(tahunLahir) ?? 0;
    int umur = DateTime.now().year - tahunLahirInt;

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Mahasiswa'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blue.shade100,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.blue.shade700,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Data Mahasiswa',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
                SizedBox(height: 30),
                Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        buildDataItem(Icons.person, 'Nama Lengkap', nama),
                        Divider(height: 30, color: Colors.grey.shade300),
                        buildDataItem(Icons.badge, 'NIM', nim),
                        Divider(height: 30, color: Colors.grey.shade300),
                        buildDataItem(
                          Icons.calendar_today,
                          'Tahun Lahir',
                          tahunLahir,
                        ),
                        Divider(height: 30, color: Colors.grey.shade300),
                        buildDataItem(Icons.cake, 'Umur', '$umur tahun'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 200,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    label: Text('Kembali'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDataItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.blue, size: 28),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
