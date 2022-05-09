 import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../page2/page2screen.dart';
import '../../widgets/gradient_button.dart';
import 'page1screen.dart';

class LoginForm extends StatefulWidget {

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

 final TextEditingController _nameController=TextEditingController();
 final TextEditingController _passwordController=TextEditingController();
 @override
 void initState(){
   super.initState();
 }

 @override
  Widget build(BuildContext context)
  {
 return Padding(
   padding: const EdgeInsets.all(30.0),
   child: Form(
     child: Column(children: [
       SizedBox(height: 2,),
         TextFormField(
           controller: _nameController,
           decoration: InputDecoration(
             icon: Icon(Icons.female_rounded,color:Color(0xff6a515e),),
             labelText: 'Your Name'
           ),
           keyboardType: TextInputType.emailAddress,
           autovalidateMode:AutovalidateMode.onUserInteraction,
         ),
       SizedBox(height: 40,),
      Row(
        children:[
           Icon(Icons.home_outlined,color: Color(0xff6a515e),),
          SizedBox(width: 2,),
          CountryCodePicker(

               initialSelection: 'IN',
              enabled: true,
               showCountryOnly: true,
               showOnlyCountryWhenClosed: true,
               favorite: ['+970'],
               padding: EdgeInsets.all(0.0),
             ),]
      ),
       SizedBox(height: 40,),
       // SizedBox(
       //   height: 10,
       // ),
       TextFormField(
         controller: _nameController,
         decoration: InputDecoration(
             icon: Icon(Icons.location_city,color:Color(0xff6a515e),),
             labelText: 'Your City'
         ),
         keyboardType: TextInputType.emailAddress,
         autovalidateMode:AutovalidateMode.onUserInteraction,
       ),

       SizedBox(
         height: 10,
       )

     ],),
   ),
 );
  }
}
