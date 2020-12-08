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

{
  directionOpt: directionOpt,
  junctionSituation: junctionSituation,
  junctionQuestion: junctionQuestion
}
