import 'package:flutter/material.dart';
import 'package:dolibarr_project/screens/page_connexion.dart';
import 'package:google_fonts/google_fonts.dart';


class PageMdpOublie extends StatelessWidget {
  const PageMdpOublie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: MyDrawer(),
     
        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.arrow_back,
            color: const Color(0xFF000000),
            size: 30,
          ), 
          onPressed: () { 
            Navigator.push(
              context, 
              MaterialPageRoute(
                  builder: (context) => PageConnexion(),
                  ),
            );
           },
        ),
      ),

 body: SingleChildScrollView(
        child: SafeArea(
        child: Center(
          child: Column(
            
            children: [
                 Container(
                margin: const EdgeInsets.only(top: 60,left: 20,bottom: 60),
             // ignore: prefer_const_constructors
             child : Text(
              'Modifier votre mot de passe',
               style: TextStyle(
    fontSize: 30,
    color:  d_blue,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic
  ),
             
             ),
             
             ),
            const SizedBox(height: 20,),

             Container( 
              child: Column(
                children: [
                 Container(
              
                 ),
                  Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    hintStyle: TextStyle(
                      fontSize: 19,
                    ),
                    
                     suffixIcon: Icon(Icons.email_outlined),
                    contentPadding: EdgeInsets.all(10),
                    
                  ) ,

                ),
              ),
                 Container(
                
                 ),
 Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Code securite',
                    hintStyle: TextStyle(
                      fontSize: 18,
                    ),
                   suffixIcon: Icon(Icons.lock_open),
                //    contentPadding: EdgeInsets.only(left: 10,bottom:0),
                    
                       
                  ) ,

                ),
                
              ),
            
                Container(
                margin: const EdgeInsets.only(top: 60),

                child: Row(
                  
                mainAxisAlignment: MainAxisAlignment.center,
               // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
            // const  SizedBox(width: 100 ),
                ElevatedButton( child: Text('Regenerer \net \nenvoyer mot de passe',
                textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                  color: Colors.white,
                 fontSize: 20,
                // fontWeight: FontWeight.w500,
                   ),
                  ),
                 onPressed: () {
                 // Navigator.push(
                   // context, 
                    //MaterialPageRoute(
                      //builder: (context) => ModifierMdp(),
                    //),
                  //  );
                },
                style: ElevatedButton.styleFrom(
                //  shape: StadiumBorder(),
                   backgroundColor: d_blue,
                  padding: EdgeInsets.all( 10)
                  

                ),
                
               
                 ) ]),
          ),
          ]),
            ),
 
           ]   )
           
            ),
        ),
        ) )
     
      ;
      
  }   
}