import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
         title: const Text('Ray-Ban Eyewear',
         style: TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 22,
         ),
         ),
         centerTitle: true, //Center the title
        ),

        body: Stack(
          children: [
            //Background Image
            Container(
              decoration: const BoxDecoration(
                image:DecorationImage(
                  image: AssetImage("images/background2.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
        const Column(
            children: [
              //SizedBox for space between AppBar and Image
              SizedBox(height: 25,
              ),

             ImageSection(
                image: 'images/logo.jpeg',
              ),

              SizedBox(height: 5,
              ),

              TitleSection(name: 'Ray-Ban',
              location: 'Milan, Italy',
              ),

               TextSection(
                description: 
                    'Ray-Ban is a world-renowned brand known for its stylish and high-quality '
                    'sunglasses and eyeglasses. Their sunglasses, like the iconic Aviator, bold '
                    'Wayfarer, and retro-inspired Clubmaster, are designed for both fashion '
                    'and function, offering UV protection and polarized lenses for glare '
                    'reduction. Ray-Ban eyeglasses are equally stylish, with a variety of frame '
                    'shapes and materials that combine comfort and durability, making them a '
                    'top choice for prescription eyewear. With a wide range of customizable '
                    'options, Ray-Ban continues to set trends in both eyewear categories, '
                    'offering timeless designs for every occasion. '
              ),

               SizedBox(height: 12,
              ),

              // Add the Next Button here
                NextButton(),

              SizedBox(height: 12,
              ),

              FooterSection(
                footerText: '© 2024 FATIN NABIHAH | UiTM Arau,Perlis',
              ),
              
            ],
        ),
          ],
        ),
      ),
      routes: {
        '/nextPage': (context) => const KnowYourEyewearPage(), // Define the route
      }
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(fontSize: 18),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/nextPage'); // Navigate to the next page
      },
      child: const Text('Next'), 
    );
  }
}

// Define the new page to navigate to
class KnowYourEyewearPage extends StatelessWidget {
  const KnowYourEyewearPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Know Your Eye Wear',
        style: TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 22,
          ),
      ),
      ),
      
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          children: [
            TypeEyewear(
              nameType: 'Ray-Ban Aviator' ,
              description: 'The Aviator is one of Ray-Ban most iconic styles, originally designed in the 1930s for U.S. aviators to protect their eyes while flying. These glasses have a teardrop-shaped lens and a thin metal frame that gives a sleek and lightweight look. They offer excellent sun protection with wide coverage. ',
              image: 'images/aviator.jpeg' ,
            ),

            TypeEyewear(
              nameType: 'Ray-Ban Wayfarer' ,
              description: 'The Wayfarer is another legendary style, introduced in the 1950s and popularized by Hollywood stars. Known for its trapezoidal frame shape and thick acetate material, it provides a bold, casual look that complements most face shapes. ',
              image: 'images/wayferer.jpeg' ,
            ),

            TypeEyewear(
              nameType: 'Ray-Ban Clubmaster' ,
              description: 'Inspired by the 1950s, the Clubmaster style has a retro yet sophisticated design. These frames have a distinct browline shape with an acetate upper and metal lower rim, creating a bold and unique look. ',
              image: 'images/clubmaster.jpeg' ,
            ),

            TypeEyewear(
              nameType: 'Ray-Ban Round' ,
              description: 'The Round style has a timeless, vintage appeal with perfectly circular lenses and a slim metal frame. It a favorite for anyone seeking a classic, intellectual look, reminiscent of John Lennon and other cultural icons. ',
              image: 'images/round.jpeg' ,
            ),

            TypeEyewear(
              nameType: 'Ray-Ban Erika' ,
              description: 'The Erika model features large, rounded lenses and a mix of metal and nylon frames, making it a modern and versatile style. It’s lightweight, comfortable, and offers a bit of extra coverage with a wider frame. ',
              image: 'images/erika.jpeg' ,
            ),

            TypeEyewear(
              nameType: 'Ray-Ban Hexagonal' ,
              description: 'This unique style combines round and square elements, creating a hexagonal shape that subtle yet eye-catching. The thin metal frames give it a lightweight feel, and it perfect for those looking to make a statement with something different. ',
              image: 'images/hexagonal.jpeg' ,
            ),
            
            TypeEyewear(
              nameType: 'Ray-Ban Blaze' ,
              description: 'The Blaze collection features futuristic, bold designs with lenses that extend over the frame for a one-piece look. It a fashion-forward choice that draws attention. ',
              image: 'images/blaze.jpeg' ,
            ),
          ],
          ),
        ),
      ),
      );
  }
}

class TypeEyewear extends StatelessWidget {
  final String nameType;
  final String description;
  final String image;

  const TypeEyewear({
    super.key,
    required this.nameType,
    required this.description,
    required this.image,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipOval(
          child: Image.asset(
          image,
          width: 80,
          height: 100,
          fit: BoxFit.cover,
        ),
            ),

            const SizedBox(height: 8),

        Text(
          nameType,
          style: const TextStyle(fontWeight: FontWeight.bold,
          fontFamily: 'Times New Roman',
          fontSize: 17,
          ),
        ),

        const SizedBox(height: 4),
        
        Text(description,
        style: const TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 17, // Set font to Times New Roman
          ),
        textAlign: TextAlign.justify),
          ],
      ),          
        ),
      );
  }
}
  
class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center, //  Center the Row's children
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, //Center content horizontally
            children: [
              /*2*/
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                location,
                style: const TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center, //Center text
                ),
            ],
            ),
            ),
      ],
    ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

@override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      color: Colors.white, //Solid background color
      borderRadius: BorderRadius.circular(10), //Rounded corners
    ),
    
    child: const Text.rich(
       TextSpan(
        text: '',
        children: <TextSpan>[
          TextSpan(
            text: 'Ray-Ban ', // Making "Ray-Ban" bold
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'is a world-renowned brand known for its stylish and high-quality '
                  'sunglasses and eyeglasses. Their sunglasses, like the iconic Aviator, bold '
                  'Wayfarer, and retro-inspired Clubmaster, are designed for both fashion '
                  'and function, offering UV protection and polarized lenses for glare '
                  'reduction. Ray-Ban eyeglasses are equally stylish, with a variety of frame '
                  'shapes and materials that combine comfort and durability, making them a '
                  'top choice for prescription eyewear. With a wide range of customizable '
                  'options, Ray-Ban continues to set trends in both eyewear categories, '
                  'offering timeless designs for every occasion.'
          ),
        ],
        ),
      softWrap: true,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontFamily: 'Times New Roman',
        fontSize:17.19, 
        height:1.35,
      ),
    ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.image
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 134.38 ,
    height: 134.38,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        ),
        image: DecorationImage(image: AssetImage(image),
        fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
    required this.footerText,
  });

  final String footerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      color: Colors.black,
      child: Center(
        child: Text(
          footerText,
          style: const TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}