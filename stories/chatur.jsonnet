{
  "name": "Chatur Tragedy",
  "author": "Eniamza",
  "description": "Mr. Chatur's, an average office worker, life was beautiful until...",
  "questions": [
    {
      "question": "Now...",
      "options": [
        {
          "opt": "ignore boss and take a break to get refreshments",
          "nextSituation": 1
        },
        {
          "opt": "Go to his chamber",
          "nextSituation": 2
        }

      ]
    },
    {
      "question": ".",
      "options": [
        {
          "opt": "ignore boss and take a break to get refreshments",
          "nextSituation": 1
        },
        {
          "opt": "Go to his chamber",
          "nextSituation": 2
        }


      ]
    },
    {
      "question": ".",
      "options": [
        {
          "opt": "Try to explain what happened",
          "nextSituation": 4
        },
        {
          "opt": "Do a direct apology",
          "nextSituation": 5
        }

      ]
    },
    {
      "question": "Your reaction will be?",
      "options": [
        {
          "opt": "What the.. I knew something was on",
          "nextSituation": 6
        },
        {
          "opt": "Meh ! Stop bluffing",
          "nextSituation": 7
        },
        {
          "opt": "I am going to kill this bastard",
          "nextSituation": 8
        }

      ]
    },
    {
      "question": "Life for life?",
      "options": [
        {
          "opt": "Maybe I should just lodge a complain",
          "nextSituation": 9
        },
        {
          "opt": "Priya will understand, I'll talk to her",
          "nextSituation": 10
        },
        {
          "opt": "Go ahead I am listening",
          "nextSituation": 11
        }

      ]
    },
    {
      "question": "That sounds neat",
      "options": [
        {
          "opt": "What if police find out?",
          "nextSituation": 12
        },
        {
          "opt": "I won't be able to forgive myself",
          "nextSituation": 10
        },
        {
          "opt": "Game is on then",
          "nextSituation": 11
        }

      ]
    },
    {
      "question": "Are you a coward?",
      "options": [
        {
          "opt": "No I won't do this,Against my ethics",
          "nextSituation": 17
        },
        {
          "opt": "Meet you after cleanup",
          "nextSituation": 16
        }

      ]
    },
    {
      "question": "What's going on",
      "options": [
        {
          "opt": "It's all a trick. Stick to the plan",
          "nextSituation": 18
        },
        {
          "opt": "I can't murder this good man. Maybe it's all misunderstanding",
          "nextSituation": 18
        }

      ]
    }

  ],

  "situations": [
    {
      "title": "Yet another day in life...",
      "description": "Wife again insulted for being away most of the time. Which seemed like a staged play. Children barely come close.\n No Surprise. Of course, your wife has misguided them to be away.\nThinking about where you made a mistake you didn't sleep.\n As expected you went to the office late. Boss called you at once",
      "nextQuestion": 0
    },
    {
      "title": "In lunch break...",
      "description": "On the way to your favorite restaurant, You receive a message from your Boss.\n> Mr. Chatur, We have a client near the eastern city. It's another one week tour for you..\n> Best of luck.\n> I'll send the details soon..\n What? Another in this month? This isn't even your job.",
      "jumpTo": 3
    },
    {
      "title": "In The chamber",
      "description": "```\nBoss: So Mr. Chatur, I am quite upset with your performance..",
      "nextQuestion" : 2
    },
    {
      "title": "Suddenly...",
      "description": " While thinking about this..\nyou walk into one of your colleagues `Rancho` Who is also one of your best friends... \n```\nRancho: Hey, Chatur! How's it going?\nYou: Nothing man! Another tour this month.\nRancho: Right when your boss and your wife were angry right?\nYou: What are you trying to say?\nRancho: Did some detective work when you were away last time. Here, Photos of your boss's car right outside of your house.\n```\nHe shows you some photos of your house and the Car.",
      "nextQuestion" : 3
    },
    {
      "title": ".",
      "description": "I have seen enough of you. If you continue like this you will have to **Leave**",
      "jumpTo": 5
    },
    {
      "title": ".",
      "description": "```\nBoss: I am not hearing anything more of your shit-talk.\nThis one week tour is your last chance to prove. Pack your things up after lunch and report to me before leaving\nYou: But sir....\nBoss: If you have problems then you are free to go for a picnic\nYou:[Angrily] It's all right sir\nBoss:[With a smile] Thought so\n```",
      "jumpTo": 3
    },
    {
      "title": "You knew and I saw",
      "description": "```\nRancho: I sensed it a long ago when you started doing more business trip\nYou: Didn't mind telling me?\nRancho: If I told you without any evidence you wouldn't believe me then\nYou: [*Breaking down for a second*] What now? Priya is my life.\nRancho: And I have the perfect plan for saving your life.\nA life for Life...\n```",
      "nextQuestion" : 4
    },
    {
      "title": "Don't believe me?",
      "description": "```\nRancho: Hard to believe...yes. I know Priya was your life\nYou: She is STILL\nRancho: Not much sure of that. Here...[flipping some more pictures] your life right in your bosses arms\nYou: [*Breaking down for a second*] What now? Priya is my life.\nRancho: And I have the perfect plan for saving your life.\nA life for Life...\n```",
      "nextQuestion" : 4
    },
    {
      "title": "And I have the perfect plan..",
      "description": "```\nLife For Life\n```",
      "nextQuestion" : 4
    },
    {
      "title": "Complain, Huh?..",
      "description": "```\nRancho: Complains are useless in these cases. Because Priya won't take your side as she is also involved in this.\nYou: So..? You're telling me to murder and go to jail?\nRancho: As I said, trust me. I have a perfect plan for getting rid of your problems. You won't get your hands dirty... At least listen\n```",
      "jumpTo" : 11
    },
    {
      "title": "You think?",
      "description": "```\nRancho: Priya won't take your side as she is also involved in this.\nYou: So..? You're telling me to murder and go to jail?\nRancho: As I said, trust me. I have a perfect plan for getting rid of your problems. You won't get your hands dirty... At least listen\n```",
      "jumpTo" : 11
    },
    {
      "title": "Wise choice",
      "description": "```\nYou know I have been in pharmacy for quite a few years...\n The best thing for killing and make it look like an accident is `Cyanide`\nOffer himself a cup of coffee put 4gm of cyanide. Boss is a heart patient so it would trigger a coronary infarction.\n Voila! Boss will be dead in a blink of an eye suffering from a heart attack. No trace, No evidence\n```",
      "nextQuestion" : 5
    },
    {
      "title": "Police? Not a chance",
      "description": "```\nRancho: Police won't find any evidence cause any report will just show a simple heart attack.\n```",
      "jumpTo" : 14
    },
    {
      "title": "It's not a sin",
      "description": "```\nRancho: In this way you are just making his illness major. And he'll be killing himself. So it's not murdering either way\nYou: what if I get caught?\nRancho: I have an A grade lawyer friend who'll get you out of any possible charges\n```",
      "jumpTo" : 14
    },
    {
      "title": "And Now the plan",
      "description": "```\nThe plan is as easy as cutting an apple\nWhen you will last report to your boss before leaving, You will tell Raju [A teaboy] to mix the cyanide in coffee.\n```",
      "jumpTo" : 15
    },
    {
      "title": "After entering the room",
      "description": "```\nAct as usual.\nRaju will bring the coffee. Wait till the boss gets a heart attack. Call an ambulance immediately after that\nDon't worry cyanide will finish him before he gets to hospital\nHere is the Bottle. Pour only 4gm\n```",
      "nextQuestion" : 6
    },
    {
      "title": "The Good soul",
      "description": "**In Room**```\nSir: So are you ready?\nYou: [Nervously] Yes sir\nSir: Sorry for scolding earlier today. I was in bad mood.\nYou: [Astonished] It's okay sir.\nSir: I know you need time to spend with your family. But after all, we are all businessmen. I have something for you\nYou: What do you mean sir?\n```\nBoss takes an envelope out of his pocket and pushes it towards you.\n```\nOpen it Mr. Chatur\n```\nYou open the envelope and see that there's two package ticket for Family trip to *Thailand*\n",
      "nextQuestion" : 7
    },
    {
      "title": "Then wait to see your wife fleeing away",
      "description": "```\nRancho: I am sure of that.\nYou: What if Raju tells someone?\nRancho: I'll take care of that. He won't open his mouth if his life is in threat\nYou: You're going to murder Raju too?\nRancho: Threat, not Murder\nYou: Are you sure the plan will work out?\nRancho: Sure as fu--\nYou: There's no other way?\nRancho: All other way doesn't have enough time\nYou: Okay let's do this\n```\n *You pick the bottle and leave the place...*",
      "jumpTo" : 16
    },
    {
      "title": "Death Arrives",
      "description": "Raju inters with two cups of coffee. As planned, The cup with a spoon is for Boss with cyanide mixed. You get a little nervous. While Boss was taking a sip you wanted to stop him from that But..\nYou feel dizzy. Shortly after, Boss gets a heart attack.\n Surprisingly, Police and ambulance arrive even before you made the call. *Police wasn't in the plan*\n```\nPolice: [Taking a peek at the cup] Mr. Chatur you are under arrest for murdering Mr. Viru Sahasrabuddhe [Boss]\n```\nWhat's happening? This wasn't also in the plan.",
      "jumpTo" : 19
    },
    {
      "title": "Snakes",
      "description": "Sitting in the backseat of the car, You were watching through the window,\n```\nRaju: I know nothing, sir, Mr. Chatur told me to put cyanide in the coffee, he also threatened me to death of my family.\nPriya: He often assaulted me and abused a lot while he was drunk.\nPolice: Don't worry Ms. Priya we will also take note of those.\nRancho: I noticed his frustration. Advised him not to take any foolish steps. But I can't even imagine He would do such a miserable act.\nPolice: We are here to take care of his acts. He will either hang or go in jail for a long time\n```",
      "jumpTo" : 20
    },
    {
      "title": "The root",
      "description": "While the car was starting, You heard a last conversation\n```\nPriya: Now we can get all the time we want\nRancho: Yeah baby, All the time\n```\nAll the time they want,\n Life is weird isn't it?",
      "nextQuestion" : -1
    }
  ]
}
