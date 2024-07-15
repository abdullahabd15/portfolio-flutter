import 'package:ab_solution_portfolio/data/portfolio.dart';
import 'package:ab_solution_portfolio/data/skill.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SingletonData {
  SingletonData._();

  static const colorAmber = Color(0xFFFDCB00);

  static List<Skill> getSkillSets() {
    const String basePath = 'assets/images';
    return [
      Skill('', 'Android SDK', imageBrand: Brands.android_os),
      Skill('$basePath/compose.png', 'Compose UI'),
      Skill('', 'Kotlin', imageBrand: Brands.kotlin),
      Skill('', 'Firebase', imageBrand: Brands.firebase),
      Skill('$basePath/square_retrofit.png', 'Retrofit'),
      Skill('$basePath/knife.png', 'Dagger Hilt'),
      Skill('', 'Java', imageBrand: Brands.java),
      Skill('', 'Flutter', imageBrand: Brands.flutter),
      Skill('$basePath/database.png', 'Room DB'),
      Skill('', 'Git', imageBrand: Brands.git),
      Skill('', 'Node.js', imageBrand: Brands.nodejs),
    ];
  }

  static List<Portfolio> getPortfolio() {
    const String basePath = 'assets/images/portfolio';
    return [
      Portfolio(
        'Kimia Farma Mobile',
        '$basePath/kfm.png',
        'Kimia Farma Mobile is an application that allows users to purchase medicine online, redeem doctor\'s prescriptions online, and access various other health services such as Clinic Reservations, Pharmacist Chat, and more.',
        // 'Kimia Farma Mobile adalah aplikasi yang memungkinkan pengguna untuk membeli obat secara online, tebus resep dokter online, dan berbagai fitur layanan kesehatan lainnya seperti Reservasi Klinik, Chat Apoteker dan lain-lain.',
        projectUrl: 'https://play.google.com/store/apps/details?id=com.kimiafarma.online&hl=id',
      ),
      Portfolio(
        'Kimia Farma - Digital Order',
        '$basePath/digital_order.png',
        'Kimia Farma - Digital Order is a product catalog application installed on Kiosk devices available at Kimia Farma pharmacies, allowing customers to purchase Kimia Farma products through the Kiosk without having to go to the cashier.',
        // 'Kimia Farma -  Digital Order adalah aplikasi katalog produk yang terpasang pada perangkat Kiosk yang tersedia di apotek Kimia Farma sehingga pelanggan bisa membeli produk-produk Kimia Farma bisa membeli melalui perangkat Kiosk tanpa harus ke Kasir.',
      ),
      Portfolio(
        'Kimia Farma - Digital Reservation',
        '$basePath/digital_reservation.png',
        'Kimia Farma - Digital Reservation is a Covid-19 test registration application installed on Kiosk devices available at Kimia Farma clinics, allowing customers to register without going through the cashier.',
        // 'Kimia Farma - Digital Reservation adalah aplikasi pendaftaran pemeriksaan tes Covid-19 yang terpasang pada perangkat Kiosk yang tersedia di klinik kimia farma agar pelanggan bisa melakukan pendaftaran tanpa melalui kasir.',
      ),
      Portfolio(
        'Ngeretail',
        '$basePath/ngeretail.png',
        'Ngeretail is an online shopping service application where store owners can purchase commonly sold products directly from their store, such as instant noodles, milk, cooking oil, toothpaste, laundry soap, and others.',
        // 'Ngeretail adalah aplikasi layanan belanja online dimana pemilik toko bisa berbelanja produk-produk yang biasa dijual langsung dari toko, seperti mie instan, susu, minyak goreng, pasta gigi, sabun cuci, dan lain-lain.',
        projectUrl: 'https://play.google.com/store/apps/details?id=com.gin.ngeretail.shop'
      ),
      Portfolio(
        'Ngeretail Point',
        '$basePath/point.png',
        'Ngeretail Point is an application used by warehouse operational staff to record the movement of goods from when they arrive to when they are ready to be delivered to customers.',
        // 'Ngeretail point adalah aplikasi yang digunakan karyawan operasional gudang untuk mencatat pergerakan barang dari mulai barang datang hingga barang siap diantarkan ke konsumen.',
      ),
      Portfolio(
        'Ngeretail Delman',
        '$basePath/delman.png',
        'Ngeretail Delman is an application that assists Ngeretail couriers in delivering packages to customers\' doorsteps.',
        // 'Ngeretail Delman adalah aplikasi yang membantu Kurir Ngeretail dalam menjalankan tugas pengantaran paket sampai ke tangan konsumen.',
      ),
    ];
  }
}
