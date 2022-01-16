import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class dashboardCard extends StatefulWidget {
  @override
  _dashboardCardState createState() => _dashboardCardState();
}

class _dashboardCardState extends State<dashboardCard> {
  
  Map<String, dynamic> paymentIntentData;

  @override
  Widget build(BuildContext context){
    return Scaffold{
      body: Center(
        child: ElevatedButton(
          onPressed: (){},
          child: Text ('Payment')
        )
      )
    };
  }

  Future<void> checkoutPayment() async{
    final url = Uri.parse(); //url from firebase

    final response = await http.get(url,
    headers:{
      'Content-Type': 'application/json'
    }
    );

    paymentIntentData = json.decode(reponse.body);

    await Stripe.instance.initialPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentData!['paymentIntent'],
        googlePay: true,
        style: ThemeMode.dark,
        merchantCountryCode: 'MY',
        merchantDisplayName: 'Digati'));
    setState(() {});

    displayPaymentSheet(); 
  }

  Future<void> displayPaymentSheet() async{
    try{
      await Stripe.instance.presentPaymentSheet(
        pararmeters: PresentPaymentSheetParameters(
          clientSecret: paymentIntentData['paymentIntent'],
          confirmPayment: true
          )
      );
      setState(() {
        paymentIntentData = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar(
          content: Text('Paid')
        )
      );
    }
    catch (e){
      print(e)
    }
  }
}
