import 'package:flutter/material.dart';
import 'dummy.dart';
import 'help.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang, $username!'),
        backgroundColor: Color.fromARGB(255, 250, 231, 24),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Color.fromARGB(255, 250, 231, 24),
              child: ListTile(
                title: Text('Butuh bantuan?'),
                subtitle: Text('Klik disini untuk ke halaman Bantuan dan Panduan'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BantuanPage()),
                  );
                },
              ),
            ),
            SizedBox(height: 16),

            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  childAspectRatio: 3 / 4, 
                  crossAxisSpacing: 10, 
                  mainAxisSpacing: 10,  
                ),
                itemCount: supermarketItemList.length, 
                itemBuilder: (context, index) {
                  SupermarketItem item = supermarketItemList[index]; 

                  return Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.network(
                            item.imageUrls[0],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name, // Nama produk
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(item.price), // Harga produk
                              SizedBox(height: 4),
                              Text('Stok: ${item.stock}'), // Stok produk
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 250, 231, 24), // Warna kuning
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black, fontSize: 16), // Teks berwarna hitam
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
