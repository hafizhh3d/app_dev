const functions = require("firebase-functions");
const admin = require('firebase-admin');
admin.initializeApp();

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const stripe = require ('stripe')(functions.config().stripe.testkey);

exports.stripePayment = functions.https.onRequest(async (req, res) => {
    const paymentIntents = await stripe.paymentIntents.create({
        amount: 1000,
        currency: 'myr'
    },
        function (err, paymentIntent){
            if (err!=null){
                console.log(err);
            }
            else{
                res.json({
                    paymentIntents: paymentIntents.client_secret
                })
            }
        }
    )
})