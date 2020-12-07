local name = 'Story Name';

{
  name: name,
  author: "Author Name",
  description: "Short Nice description to showcase a view of the story",
  variables: {
    var1: 'lol',
    var2: 2
  },
  questions: [
    {
      question: "Quetion number 0",
      options: [
        {
          opt: "Option 1 in question 0",
          nextSituation: 1
        },
        {
          opt: "Option 2 in question 0",
          nextSituation: 2
        }

      ]
    },
    {
      question: "Question number 1",
      options: [
        {
          opt: "Option 1 in question 1",
          nextSituation: 1,
          setVariables: {
            var1: 'mol',
            var2: 4
          }
        },
        {
          opt: "Option 2 in quesition 2",
          nextSituation: 2,
          conditionalNext: [
            {
              condition: {
                variables: {
                  var2: 2
                }
              },
              nextSituation: 1
            },
            {
              condition: {
                variables: {
                  var2: 2
                }
              },
              nextSituation: 0
            }
          ]
        }
      ]
    }
  ],

  situations: [
    {
      title: "Situation Number 0",
      description: "The situation of story which supports discord related markdown",
      nextQuestion: 0,
      setVariables: {
        var1: 'kol'
      }
    },
    {
      title: "Situation number 1",
      description: "The situation of story which supports discord related markdown",
      jumpTo: -1 // -1 marks the end or the story.
    }
  ]
}
