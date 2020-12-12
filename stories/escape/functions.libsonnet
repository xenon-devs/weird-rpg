local DIRECTIONS = import './directions.jsonnet';
local DIRECTIONS_GO = import './directions-go.jsonnet';

local directionOpt(dir, nextSituation, conditionalNext = []) = {
  opt: DIRECTIONS_GO[dir],
  nextSituation: nextSituation,
  conditionalNext: conditionalNext
};

local junctionQuestion(options) = {
  question: "What will you do?",
  options: options
};

local junctionSituation(directions, nextQuestion) = {
  title: "Junction",
  description: std.join('\n', ["%s" % DIRECTIONS[x], for x in directions]) + "\n All directions are shown assuming you are looking at the 2D map from above.",
  nextQuestion: nextQuestion
};

local digitQuestion(digit, nextSituation, conditionalNext = []) = {
  question: "Which weight will you place?",
  options: [
    {opt: "Place no weight.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 0}},
    {opt: "Place weight 1.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 1}},
    {opt: "Place weight 2.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 2}},
    {opt: "Place weight 3.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 3}},
    {opt: "Place weight 4.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 4}},
    {opt: "Place weight 5.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 5}},
    {opt: "Place weight 6.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 6}},
    {opt: "Place weight 7.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 7}},
    {opt: "Place weight 8.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 8}},
    {opt: "Place weight 9.", nextSituation: nextSituation, conditionalNext: conditionalNext, setVariables: {['digit' + digit]: 9}},
  ],
};

{
  directionOpt: directionOpt,
  junctionSituation: junctionSituation,
  junctionQuestion: junctionQuestion,
  digitQuestion: digitQuestion,
}
