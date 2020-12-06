local CHARACTERS = {
  chatur: 'Chatur',
  rancho: 'Rancho',
  chatur_wife: 'Priya',
  boss: 'Viru Sahastrabuddhe',
  teaboy: 'Raju'
};

{
  name: CHARACTERS.chatur + ' Tragedy',
  author: 'Eniamza',
  description: 'Mr. %s is an average office worker, life was beautiful until...'%CHARACTERS.chatur,
  questions: [
    {
      question: 'Now...',
      options: [
        {
          opt: "Ignore your boss and take a break to get refreshments.",
          nextSituation: 1
        },
        {
          opt: "Go to his chamber.",
          nextSituation: 2
        }

      ]
    },
    {
      question: ".",
      options: $.questions[0].options,
    },
    {
      question: ".",
      options: [
        {
          opt: "Try to explain what happened.",
          nextSituation: 4
        },
        {
          opt: "Do a direct apology.",
          nextSituation: 5
        }

      ]
    },
    {
      question: "What will your reaction be?",
      options: [
        {
          opt: "What the... I knew something was on!",
          nextSituation: 6
        },
        {
          opt: "Meh! Stop bluffing.",
          nextSituation: 7
        },
        {
          opt: "I am going to kill this bastard!",
          nextSituation: 8
        }

      ]
    },
    {
      question: "Life for life?",
      options: [
        {
          opt: "Maybe I should just lodge a complain",
          nextSituation: 9
        },
        {
          opt: "%s will understand, I'll talk to her."%CHARACTERS.chatur_wife,
          nextSituation: 10
        },
        {
          opt: "Go ahead, I am listening.",
          nextSituation: 11
        }

      ]
    },
    {
      question: "That sounds neat",
      options: [
        {
          opt: "What if the police find out?",
          nextSituation: 12
        },
        {
          opt: "I won't be able to forgive myself.",
          nextSituation: 10
        },
        {
          opt: "Game is on then.",
          nextSituation: 11
        }

      ]
    },
    {
      question: "Are you a coward?",
      options: [
        {
          opt: "No I won't do this, it is against my ethics.",
          nextSituation: 17
        },
        {
          opt: "Meet you after cleanup.",
          nextSituation: 16
        }

      ]
    },
    {
      question: "What's going on?",
      options: [
        {
          opt: "It's all a trick. Stick to the plan.",
          nextSituation: 18
        },
        {
          opt: "I can't murder this good man. Maybe it's all misunderstanding",
          nextSituation: 18
        }

      ]
    }

  ],

  situations: [
    {
      title: "Yet another day in life...",
      description: |||
        Wife insulted you again for being away most of the time, which seemed like a staged play. Children barely come close.
        No Surprise. Of course, your wife has misguided them to be away.
        Thinking about where you made a mistake you didn't sleep.
        As expected you went to the office late. Boss called you at once.
      |||,
      nextQuestion: 0
    },
    {
      title: "During the lunch break...",
      description: |||
        On the way to your favorite restaurant, you receive a message from your Boss.
        > Mr. %s, We have a client near the eastern city. It's another one week tour for you...
        > Best of luck.
        > I'll send the details soon...
        What? Another one this month? This isn't even your job.
      |||%CHARACTERS.chatur,
      jumpTo: 3
    },
    {
      title: "In The chamber",
      description: "
        ```
        Boss: So Mr. %s, I am quite upset with your performance..
        ```
      "%CHARACTERS.chatur,
      nextQuestion : 2
    },
    {
      title: "Suddenly...",
      description: |||
        While thinking about this...
        you walk into one of your colleagues, %(rancho)s, who is also one of your best friends...
        ```
        %(rancho)s: Hey, %(chatur)s! How's it going?
        You: Nothing man! Another tour this month.
        %(rancho)s: Right when your boss and your wife were angry right?
        You: What are you trying to say?
        %(rancho)s: Did some detective work when you were away last time. Here, photos of your boss's car right outside of your house.
        ```
        He shows you some photos of your house and the Car.
      |||%CHARACTERS,
      nextQuestion: 3
    },
    {
      title: ".",
      description: "I have seen enough of you. If you continue like this, you will have to **Leave**",
      jumpTo: 5
    },
    {
      title: ".",
      description: |||
        ```
        Boss: I am not hearing anything more of your shit-talk.
        This one week tour is your last chance to prove.
        Pack your things up after lunch and report to me before leaving
        You: But sir...
        Boss: If you have problems then you are free to go for a picnic
        You:[Angrily] It's all right sir
        Boss:[With a smile] Thought so
        ```
      |||,
      jumpTo: 3
    },
    {
      title: "You knew and I saw",
      description: |||
        ```
        %(rancho)s: I sensed it a long ago when you started doing more business trip
        You: Didn't mind telling me?
        %(rancho)s: If I told you without any evidence you wouldn't believe me then
        You: [*Breaking down for a second*] What now? %(chatur_wife)s is my life.
        %(rancho)s: And I have the perfect plan for saving your life.
        A life for Life...
        ```
      |||%CHARACTERS,
      nextQuestion: 4
    },
    {
      title: "Don't believe me?",
      description: |||
        ```
        %(rancho)s: Hard to believe...yes. I know %(chatur_wife)s was your life
        You: She STILL is.
        %(rancho)s: Not much sure of that. Here...[flipping some more pictures] your life right in your bosses arms.
        You: [*Breaking down for a second*] What now? %(chatur_wife)s is my life.
        %(rancho)s: And I have the perfect plan for saving your life.
        A life for Life...
        ```
      |||%CHARACTERS,
      nextQuestion: 4
    },
    {
      title: "And I have the perfect plan..",
      description: |||
        ```
        Life For Life
        ```
      |||,
      nextQuestion : 4
    },
    {
      title: "Complain, Huh?..",
      description: |||
        ```
        %(rancho)s: Complaints are useless in these cases. Because %(chatur_wife)s won't take your side as she is also involved in this.
        You: So..? You're telling me to murder and go to jail?
        %(rancho)s: As I said, trust me. I have a perfect plan for getting rid of your problems. You won't get your hands dirty... At least listen
        ```
      |||%CHARACTERS,
      jumpTo: 11
    },
    {
      title: "You think?",
      description: |||
        ```
        %(rancho)s: %(chatur_wife)s won't take your side as she is also involved in this.
        You: So..? You're telling me to murder and go to jail?
        %(rancho)s: As I said, trust me. I have a perfect plan for getting rid of your problems. You won't get your hands dirty... At least listen
        ```
      ||| %CHARACTERS,
      jumpTo: 11
    },
    {
      title: "Wise choice",
      description: |||
        ```
        You know I have been in pharmacy for quite a few years...
        The best thing for killing and make it look like an accident is `Cyanide`
        Offer himself a cup of coffee put 4gm of cyanide. Boss is a heart patient so it would trigger a coronary infarction.
        Voila! Boss will be dead in a blink of an eye suffering from a heart attack. No trace, No evidence
        ```
      |||,
      nextQuestion: 5
    },
    {
      title: "Police? Not a chance",
      description: |||
        ```
        %(rancho)s: Police won't find any evidence cause any report will just show a simple heart attack.
        ```
      |||%CHARACTERS,
      jumpTo: 14
    },
    {
      title: "It's not a sin",
      description: |||
        ```
        %(rancho)s: In this way you are just making his illness major. And he'll be killing himself. So it's not murdering either way
        You: what if I get caught?
        %(rancho)s: I have an A grade lawyer friend who'll get you out of any possible charges
        ```
      |||%CHARACTERS,
      jumpTo: 14
    },
    {
      title: "And Now the plan",
      description: |||
        ```
        The plan is as easy as cutting an apple
        When you will last report to your boss before leaving, You will tell %(teaboy)s [A teaboy] to mix the cyanide in coffee.
        ```
      |||%CHARACTERS,
      jumpTo: 15
    },
    {
      title: "After entering the room",
      description: |||
        ```
        Act as usual.
        %(teaboy)s will bring the coffee. Wait till the boss gets a heart attack. Call an ambulance immediately after that.
        Don't worry cyanide will finish him before he gets to hospital
        Here is the Bottle. Pour only 4gm
        ```
      |||%CHARACTERS,
      nextQuestion: 6
    },
    {
      title: "The Good soul",
      description: |||
        __In the Room__
        ```
        Sir: So are you ready?
        You: [Nervously] Yes sir
        Sir: Sorry for scolding earlier today. I was in bad mood.
        You: [Astonished] It's okay sir.
        Sir: I know you need time to spend with your family. But after all, we are all businessmen. I have something for you
        You: What do you mean sir?
        ```
        Boss takes an envelope out of his pocket and pushes it towards you.
        ```
        Open it Mr. %s
        ```
        You open the envelope and see that there's two package ticket for Family trip to *Thailand*
      |||%CHARACTERS.chatur,
      nextQuestion: 7
    },
    {
      title: "Then wait to see your wife fleeing away",
      description: |||
        ```
        %(rancho)s: I am sure of that.
        You: What if %(teaboy)s tells someone?
        %(rancho)s: I'll take care of that. He won't open his mouth if his life is in threat
        You: You're going to murder %(teaboy)s too?
        %(rancho)s: Threat, not Murder
        You: Are you sure the plan will work out?
        %(rancho)s: Sure as fu--
        You: There's no other way?
        %(rancho)s: All other way doesn't have enough time
        You: Okay let's do this
        ```
        *You pick the bottle and leave the place...*
      |||%CHARACTERS,
      jumpTo: 16
    },
    {
      title: "Death Arrives",
      description: |||
        %(teaboy)s enters with two cups of coffee. As planned, The cup with a spoon is for Boss with cyanide mixed. You get a little nervous. While Boss was taking a sip you wanted to stop him from that But...
        You feel dizzy. Shortly after, Boss gets a heart attack.
        Surprisingly, Police and ambulance arrive even before you made the call. *Police wasn't in the plan*
        ```
        Police: [Taking a peek at the cup] Mr. %(chatur)s you are under arrest for murdering Mr. %(boss)s [Boss]
        ```
        What's happening? This wasn't also in the plan.
      |||%CHARACTERS,
      jumpTo: 19
    },
    {
      title: "Snakes",
      description: |||
        Sitting in the backseat of the car, you were watching through the window,
        ```
        %(teaboy)s: I know nothing, sir, Mr. %(chatur)s told me to put cyanide in the coffee, he also threatened me to death of my family.
        %(chatur_wife)s: He often assaulted me and abused a lot while he was drunk.
        Police: Don't worry Mrs. %(chatur_wife)s we will also take note of those.
        %(rancho)s: I noticed his frustration. Advised him not to take any foolish steps. But I can't even imagine He would do such a miserable act.
        Police: We are here to take care of his acts. He will either hang or go in jail for a long time
        ```
      |||%CHARACTERS,
      jumpTo: 20
    },
    {
      title: "The root",
      description: |||
        While the car was starting, you heard a last conversation
        ```
        %(chatur_wife)s: Now we can get all the time we want
        %(rancho)s: Yeah baby, All the time
        ```
        All the time they want,
        Life is weird isn't it?
      |||%CHARACTERS,
      nextQuestion : -1
    }
  ]
}
