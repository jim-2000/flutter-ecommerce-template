import 'package:app/models/productModel.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Products {
  static List<Product> products = [
    Product(
      id: uuid.v4(),
      title: 'Samsung Galaxy S9',
      description:
          'Samsung Galaxy S9 G960U 64GB Unlocked GSM 4G LTE Phone w/ 12MP Camera - Midnight Black',
      price: 50.99,
      imageUrl: [
        'https://images-na.ssl-images-amazon.com/images/I/81%2Bh9mpyQmL._AC_SL1500_.jpg',
      ],
      productBrandName: 'Samsung',
      productCatagoryName: 'Phones',
      quantity: 65,
      isFavorite: false,
      isPopular: false,
      catagories: 'Phones',
    ),
    Product(
      id: uuid.v4(),
      title: 'Samsung Galaxy A10s',
      description:
          'Samsung Galaxy A10s A107M - 32GB, 6.2" HD+ Infinity-V Display, 13MP+2MP Dual Rear +8MP Front Cameras, GSM Unlocked Smartphone - Blue.',
      price: 50.99,
      imageUrl: [
        'https://images-na.ssl-images-amazon.com/images/I/51ME-ADMjRL._AC_SL1000_.jpg'
      ],
      productBrandName: 'Samsung ',
      productCatagoryName: 'Phones',
      quantity: 1002,
      isFavorite: false,
      catagories: 'Phones',
      isPopular: false,
    ),
    Product(
        id: uuid.v4(),
        title: 'Samsung Galaxy A51',
        catagories: 'Phones',
        description:
            'Samsung Galaxy A51 (128GB, 4GB) 6.5", 48MP Quad Camera, Dual SIM GSM Unlocked A515F/DS- Global 4G LTE International Model - Prism Crush Blue.',
        price: 50.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/61HFJwSDQ4L._AC_SL1000_.jpg'
        ],
        productBrandName: 'Samsung',
        productCatagoryName: 'Phones',
        quantity: 6423,
        isFavorite: false,
        isPopular: true),
    Product(
        id: uuid.v4(),
        title: 'Apple MacBook Air',
        catagories: 'laptop',
        description:
            'Apple MacBook Air 13.3" with Retina Display, 1.1GHz Quad-Core Intel Core i5, 16GB Memory, 256GB SSD, Space Gray (Early 2020)',
        price: 1220.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/61wLbRLshAL._AC_SL1200_.jpg'
        ],
        productBrandName: 'Apple',
        productCatagoryName: 'Laptops',
        quantity: 815,
        isFavorite: false,
        isPopular: true),
    Product(
        id: uuid.v4(),
        catagories: 'laptop',
        title: 'Apple MacBook Pro',
        description:
            'Apple MacBook Pro MF839LL/A 13.3in Laptop, Intel Core i5 2.7 GHz, 8GB Ram, 128GB SSD ',
        price: 700.89,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/315CQ1KmlwL._AC_.jpg'
        ],
        productBrandName: 'Apple',
        productCatagoryName: 'Laptops',
        quantity: 815,
        isFavorite: false,
        isPopular: false),
    Product(
        catagories: 'laptop',
        id: uuid.v4(),
        title: 'Apple MacBook Air',
        description:
            'Apple MacBook Air 13.3" with Retina Display, 1.1GHz Quad-Core Intel Core i5, 8GB Memory, 256GB SSD, Silver (Early 2020)',
        price: 780.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/61QRQHn0jJL._AC_SL1200_.jpg'
        ],
        productBrandName: 'Apple',
        productCatagoryName: 'Laptops',
        quantity: 4455,
        isFavorite: false,
        isPopular: true),
    Product(
        catagories: 'laptop',
        id: uuid.v4(),
        title: 'Apple 16 MacBook Pro',
        description:
            'Apple 16 MacBook Pro with Touch Bar, 9th-Gen 8-Core Intel i9 2.3GHz, 16GB RAM, 1TB SSD, AMD Radeon Pro 5500M 8GB, Space Gray, Late 2019 Z0Y0005J7 / Z0Y00006M',
        price: 800.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/61qNHbx9LDL._AC_SL1200_.jpg'
        ],
        productBrandName: 'Apple',
        productCatagoryName: 'Laptops',
        quantity: 885,
        isFavorite: false,
        isPopular: false),
    Product(
        catagories: 'firniture',
        id: uuid.v4(),
        title: 'Sofa Set',
        description: 'Beverly Fine Funiture Sectional Sofa Set, 91A Black ',
        price: 650.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/71P-p2sj6eL._AC_SL1500_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Furniture',
        quantity: 91,
        isFavorite: false,
        isPopular: true),
    Product(
        catagories: 'firniture',
        id: uuid.v4(),
        title: 'Furniture Classroom with Teacher\'s',
        description:
            'L.O.L. Surprise! Furniture Classroom with Teacher\'s Pet & 10+ Surprises',
        price: 120.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/71xytsyiHzL._AC_SL1500_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Furniture',
        quantity: 815,
        isFavorite: false,
        isPopular: false),
    Product(
        catagories: 'firniture',
        id: uuid.v4(),
        title: 'Sofa Couch for Two People',
        description:
            'Serta Copenhagen Sofa Couch for Two People, Pillowed Back Cushions and Rounded Arms, Durable Modern Upholstered Fabric, 61" Loveseat, Brown',
        price: 1220.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/81sBT3voCPL._AC_SL1500_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Furniture',
        quantity: 8100,
        isFavorite: false,
        isPopular: true),
    Product(
        catagories: 'firniture',
        id: uuid.v4(),
        title: 'Delta Children Plastic Toddler Bed',
        description:
            'Delta Children Plastic Toddler Bed, Disney Princess + Delta Children Twinkle Galaxy Dual Sided Recycled Fiber Core Toddler Mattress (Bundle)',
        price: 127.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/71Rj3InxQlL._SL1500_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Furniture',
        quantity: 9145,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        title: 'Outdoor Patio ',
        catagories: 'firniture',
        description:
            'Recaceik 3 Pieces Outdoor Patio Furniture Sets Rattan Chair Wicker Set, with Cushions and Tempered Glass Tabletop, Outdoor Indoor Use Backyard Porch Garden-(Brown)',
        price: 1224.88,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/81KabJxRvDL._AC_SL1500_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Furniture',
        quantity: 25,
        isFavorite: false,
        isPopular: true),
    Product(
        id: uuid.v4(),
        title: 'Flash Furniture Nantucket 6 Piece',
        catagories: 'firniture',
        description:
            'Flash Furniture Nantucket 6 Piece Black Patio Garden Set with Table, Umbrella and 4 Folding Chairs',
        price: 1220.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/81khjDZg5xL._AC_SL1500_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Furniture',
        quantity: 651,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        title: 'Homall 4 Pieces Patio Outdoor Furniture Sets',
        catagories: 'firniture',
        description:
            'Homall 4 Pieces Patio Outdoor Furniture Sets, All Weather PE Rattan Wicker Sectional Sofa Modern Manual Conversation Sets with Cushions and Glass Table for Lawn Backyard Garden Poolside（Beige）',
        price: 1220.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/716-fllmUCL._AC_SL1500_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Furniture',
        quantity: 594,
        isFavorite: false,
        isPopular: true),
    Product(
        id: uuid.v4(),
        title: 'Ashley Furniture Signature Design',
        catagories: 'firniture',
        description:
            'Ashley Furniture Signature Design - Dolante Upholstered Bed - Queen Size - Complete Bed Set in a Box - Contemporary Style Checker - Gray',
        price: 300.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/71QxxtRFFkL._AC_SL1232_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Furniture',
        quantity: 78,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        title: 'Apple Watch Series 3',
        catagories: 'electronics',
        description:
            'Apple Watch Series 3 (GPS, 38mm) - Silver Aluminum Case with White Sport Band',
        price: 100.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/71vCuRn4CkL._AC_SL1500_.jpg'
        ],
        productBrandName: 'Apple',
        productCatagoryName: 'Watches',
        quantity: 156,
        isFavorite: false,
        isPopular: true),
    Product(
        id: uuid.v4(),
        title: 'Garmin Forerunner 45S',
        catagories: 'watch',
        description:
            'Garmin Forerunner 45S, 39mm Easy-to-use GPS Running Watch with Coach Free Training Plan Support, Purple',
        price: 86.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/51EWl3XsiYL._AC_SL1000_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Watches',
        quantity: 142,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        title: 'Samsung Galaxy Watch Active 2',
        catagories: 'watch',
        description:
            'Samsung Galaxy Watch Active 2 (40mm, GPS, Bluetooth) Smart Watch with Advanced Health Monitoring, Fitness Tracking , and Long Lasting Battery - Silver (US Version)',
        price: 300.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/51bSW9gjoaL._AC_SL1024_.jpg'
        ],
        productBrandName: 'Samsung',
        productCatagoryName: 'Watches',
        quantity: 167,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        title: 'Garmin vivoactive 4S',
        catagories: 'watch',
        description:
            'Garmin vivoactive 4S, Smaller-Sized GPS Smartwatch, Features Music, Body Energy Monitoring, Animated Workouts, Pulse Ox Sensors, Rose Gold with White Band',
        price: 40.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/51r2LCE3FLL._AC_SL1000_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Watches',
        quantity: 659,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        title: 'Patek Philippe World',
        catagories: 'watch',
        description: 'Patek Philippe World Time Men\'s Watch Model 5131/1P-001',
        price: 20.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/61MVdCYfbOL._AC_UX679_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Watches',
        quantity: 98,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        title: 'Bell & Ross Men',
        catagories: 'electronics',
        description:
            'Bell & Ross Men\'s BR-MNUTTOURB-PG Minuteur\' Black Carbon Fiber Dial 18K Rose Gold Tourbillon Watch',
        price: 33.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/91M50AHRTKL._AC_UX569_.jpg'
        ],
        productBrandName: 'No productBrandName',
        productCatagoryName: 'Watches',
        quantity: 951,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        title: 'New Apple Watch Series',
        catagories: 'watch',
        description:
            'New Apple Watch Series 6 (GPS, 40mm) - Blue Aluminum Case with Deep Navy Sport Band ',
        price: 400.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/71bf9IpGjtL._AC_SL1500_.jpg'
        ],
        productBrandName: 'Apple',
        productCatagoryName: 'Watches',
        quantity: 951,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        catagories: 'watch',
        title: 'New Apple Watch SE',
        description:
            'New Apple Watch SE (GPS, 40mm) - Gold Aluminum Case with Pink Sand Sport Band',
        price: 200.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/71JtUMDeBBL._AC_SL1500_.jpg'
        ],
        productBrandName: 'Apple',
        productCatagoryName: 'Watches',
        quantity: 951,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        title: 'YAMAY Smart Watch 2020 Ver',
        catagories: 'watch',
        description:
            'YAMAY Smart Watch 2020 Ver. Watches for Men Women Fitness Tracker Blood Pressure Monitor Blood Oxygen Meter Heart Rate Monitor IP68 Waterproof, Smartwatch Compatible with iPhone Samsung Android Phones',
        price: 183.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/61gCtkVYb5L._AC_SL1000_.jpg'
        ],
        productBrandName: 'Apple',
        productCatagoryName: 'Watches',
        quantity: 56,
        isFavorite: false,
        isPopular: true),
    Product(
        id: uuid.v4(),
        title: 'Samsung Galaxy Watch Active ',
        catagories: 'watch',
        description:
            'Samsung Galaxy Watch Active (40MM, GPS, Bluetooth) Smart Watch with Fitness Tracking, and Sleep Analysis - Rose Gold  (US Version)',
        price: 150.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/61n1c2vnPJL._AC_SL1500_.jpg'
        ],
        productBrandName: 'Samsung',
        productCatagoryName: 'Watches',
        quantity: 78,
        isFavorite: false,
        isPopular: true),
    Product(
        id: uuid.v4(),
        title: 'Samsung Galaxy Watch 3',
        catagories: 'watch',
        description:
            'Samsung Galaxy Watch 3 (41mm, GPS, Bluetooth) Smart Watch with Advanced Health monitoring, Fitness Tracking , and Long lasting Battery - Mystic Silver (US Version)',
        price: 184.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/81Iu41zFPwL._AC_SL1500_.jpg'
        ],
        productBrandName: 'Samsung',
        productCatagoryName: 'Watches',
        quantity: 9598,
        isFavorite: false,
        isPopular: true),
    Product(
        id: uuid.v4(),
        catagories: 'watch',
        title: 'Samsung Galaxy Watch Active2 ',
        description:
            'Samsung Galaxy Watch Active2 (Silicon Strap + Aluminum Bezel) Bluetooth - International (Aqua Black, R820-44mm)',
        price: 120.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/518qjbbuGZL._AC_SL1000_.jpg'
        ],
        productBrandName: 'Samsung',
        productCatagoryName: 'Watches',
        quantity: 951,
        isFavorite: false,
        isPopular: false),
    Product(
        id: uuid.v4(),
        catagories: 'watch',
        title: 'Huawei Watch 2 Sport Smartwatch',
        description:
            'Huawei Watch 2 Sport Smartwatch - Ceramic Bezel - Carbon Black Strap (US Warranty)',
        price: 180.99,
        imageUrl: [
          'https://images-na.ssl-images-amazon.com/images/I/71yPa1g4gWL._AC_SL1500_.jpg'
        ],
        productBrandName: 'Huawei',
        productCatagoryName: 'Watches',
        quantity: 951,
        isFavorite: false,
        isPopular: true),
  ];
}
