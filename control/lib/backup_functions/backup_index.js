exports.resetQuestionnaire = functions.pubsub.schedule("* * * * *")
    .onRun((context) => {
        database.doc("data/completionStatus")
            .update({ "completionStatus": false });
    });

exports.resetQuestionnaireThree = functions.pubsub.schedule("* * * * *")
    .onRun(async (context) => {
        try {
            const authUser = await admin.auth().getUser(uid);
            database.doc(`users/${authUser}/surveyAnswers/completionStatus`)
                .update({ "completionStatus": false });
        } catch (error) {
            console.log("error");
        }
    });

exports.userAdded = functions.auth.user().onCreate(user => {
    console.log(`${user.email} is created`);
    return Promise.resolve();
})


exports.resetQuestionnaireTwo = functions.pubsub.schedule("* * * * *")
    .onRun((context) => {
        const db = admin.firestore();
        db.collection('users').get()
            .then(snapshot => {
                let batch = db.batch();
                snapshot.forEach(doc => {
                    batch.update({ "completionStatus": false });
                });
                return batch.commit()
            })
            .catch(error => {
                console.log(error)
            })
    });


    exports.resetQuestionnaireFour = functions.pubsub.schedule("* * * * *")
    .onRun((context) => {
        return database.doc('users/'+user+'/surveyAnswers/completionStatus')
            .update({ completionStatus: false });
    });

    exports.ayaya = functions.pubsub.schedule("* * * * *")
    .onRun((context) => {
      return admin.firestore().collection('/users/'+user+'/surveyAnswers')
        .doc('completionStatus').get().then(snapshot => {
          const promises = [];
          snapshot.forEach(doc => {
            promises.push(doc.ref.update({
                completionStatus: false
            }));
          });
          return Promise.all(promises)
      })
      .catch(error => {
        console.log(error);
        return null;
      });
  });




  exports.cycleInfoTextOne = functions.pubsub.schedule("* * * * *")
  .onRun((context) => {
    db.doc("data/infoTexts").get().then((snapshot) => {
      Promise.all(snapshot.infoTextOne.map).then;
      if (i < 7) {
        i++;
        db.doc("data/infoTexts")
            .update({"infoTextOne": i});
        return i;
      }
    });
  });


exports.emissionsUpdate = functions.database.ref('users/{user}/surveyAnswers').onWrite(event => {
    db.ref('')
});

exports.cycleFunction = functions.pubsub.schedule("* * * * *").onRun(async (context) => {
    xd = await admin.firestore().collection("data").doc("infoTexts").get();
    if (xd.data().infoTextOne < 7) {
      return admin.firestore().collection("data").doc("infoTexts").update({ infoTextOne: FieldValue.increment(1) });
    }
  });