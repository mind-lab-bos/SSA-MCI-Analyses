//command to run local server
//python3 -m http.server --cgi 8080
const cnvSIZE = 600
let numSquares = 12
let q = function(p){};
let sketch = new p5(q);
let resetSketch = true;

//let halfBoard;
let squareLength = cnvSIZE/numSquares
let rectSize = cnvSIZE/numSquares


let grid = new Grid();
let samples = [];

let noteSeries = [];
let temperament = "EQUAL"
const INTERVAL1 = 3.02
const INTERVAL2 = 1.33
const INTERVAL3 = 1.47
const EQUALINTERVAL = 1.463
const OCTAVE = 19.02

async function setupAudioWorklet() {
  await audioContext.audioWorklet.addModule('js/sound-file-processor.js');
  await audioContext.audioWorklet.addModule('js/amplitude-processor.js');
}

setupAudioWorklet();

// noteSeries[0] = 60;
// noteSeries[1] = INTERVAL1 + noteSeries[0]
// noteSeries[2] = INTERVAL2 + noteSeries[1]
// noteSeries[3] = INTERVAL3 + noteSeries[2]
// noteSeries[4] = INTERVAL1 + noteSeries[3]
// noteSeries[5] = INTERVAL2 + noteSeries[4]
// noteSeries[6] = INTERVAL1 + noteSeries[5]
// noteSeries[7] = INTERVAL3 + noteSeries[6]
// noteSeries[8] = INTERVAL1 + noteSeries[7]
let patternNum = 0;
let patternButtons = [];




function setup() {
  // halfBoard = round(numSquares/2);
  // if (numSquares > 9){
  //   for (let i = 9; i < numSquares; i++){
  //     noteSeries[i] = noteSeries[i%9] + floor(i/9) * OCTAVE
  //   }
  // }

  for(let i = 0; i < numSquares; i++){
    noteSeries[i] = 60 + EQUALINTERVAL*i;
  }
  createCanvas(cnvSIZE, cnvSIZE)
  background(220);
  let inputField = createInput();
  inputField.value(numSquares);
  inputField.size(50);
  // input.position(20, 65);
  let resize = createButton('resize');
  resize.mousePressed(function(){grid.setSize(inputField.value())});
  //submit.position(input.x + input.width, input.y);
  let playLoop = createButton('play/stop')
  playLoop.mousePressed(function() {playGrid()})
  let save = createButton('save pattern')
  save.mousePressed(function() { patternNum++; grid.storeSelection(patternNum);})
  let clear = createButton('clear')
  clear.mousePressed(function() {grid.clear();})
  // let like = createButton('like');
  // like.mousePressed(function(){grid.liker(1);})
  // let dislike = createButton('dislike');
  // dislike.mousePressed(function(){grid.liker(0);})
  let startSketch = createButton('Assess')
  startSketch.mousePressed(function(){
    // sketch.remove();
    // //sketch = null;
    // sketch = new p5(q);})
    if (resetSketch){
      sketch = new p5(q);
      resetSketch = false;
    } else {
      resetSketch = true;
    }
    
      }
    )
  }

// function check_columnSelected(column){
//   for (let
