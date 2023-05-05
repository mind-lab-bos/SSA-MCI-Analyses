class Grid {
  constructor() {
    this.initializeSelected();
  }
  initializeSelected(){
    this.selected = [];
    for (let i = 0; i < numSquares; i++) {
      this.selected[i] = [];
      for (let j = 0; j < numSquares; j++) {
        this.selected[i][j] = false;
      }
    }
    this.notePattern = [];
    for (let i = 0; i < numSquares; i++){
      this.notePattern[i] = null
    }
  }
  clearColumn(column) {
    for (let i = 0; i < numSquares; i++) {
      rect(column * squareLength, i * squareLength, rectSize, rectSize);
      this.selected[column][i] = false;
    }
    // stroke("red");
    // line(halfBoard * squareLength, 0, halfBoard * squareLength, cnvSIZE);
    // stroke("black");
  }

  clear() {
    for (let j = 0; j < numSquares; j++) {
      this.clearColumn(j);
    }
  }

  storeSelection(presetNum) {
    patternButtons[presetNum] = createButton("preset" + presetNum);
    storeItem("preset" + presetNum, this.selected);
    patternButtons[presetNum].mousePressed(function () {
      grid.displayPattern(presetNum);
    });
  }

  displayPattern(presetNum) {
    this.preSelected = getItem("preset" + presetNum);
    this.setSize(this.preSelected.length);
    this.selected = this.preSelected;
    for (let i = 0; i < numSquares; i++) {
      for (let j = 0; j < numSquares; j++) {
        if (this.selected[i][j]) {
          fill("red");
        } else {
          fill("white");
        }
        rect(i * rectSize, j * rectSize, rectSize, rectSize);
      }
    }
  }
  liker(liked){
    this.getNotePattern();
    samples.push(new Sample(this.notePattern,liked))
  }
  
//   createButtons(){
//     let playLoop = createButton('play/stop')
//   // // playLoop.mousePressed(playGrid)
//   playLoop.mousePressed(function(){playGrid()})
//   let save = createButton('save pattern')
//   // // save.mousePressed(function() { patternNum++; storeSelection(patternNum);})
//   save.mousePressed(function() { patternNum++; grid.storeSelection(patternNum);})
//   let clear = createButton('clear')
//   // // clear.mousePressed(clearGrid)
//   clear.mousePressed(function(){grid.clear();})
  
//   }
  mousePressed(){
    let selectedSquare = [floor(mouseX/squareLength), floor(mouseY/squareLength)]
    if(this.selected[selectedSquare[0]][selectedSquare[1]]){
      fill ('white')
      rect(selectedSquare[0] * squareLength, selectedSquare[1] * squareLength, rectSize,rectSize)
      this.selected[selectedSquare[0]][selectedSquare[1]] = false

    } else {
      this.clearColumn(selectedSquare[0])
      fill ('red')
      rect(selectedSquare[0] * squareLength, selectedSquare[1] *               squareLength,rectSize,rectSize)
      fill (255)
      this.selected[selectedSquare[0]][selectedSquare[1]] = true
    }
  }
  
  getNotePattern(){
    for (let i = 0; i < numSquares; i++){
      for (let j = 0; j < numSquares; j++){
        if (this.selected[i][j]){
          // if (i > halfBoard){
          //   this.notePattern[i] = round(noteSeries[numSquares - j-1]);
          // } else {
          //   this.notePattern[i] = noteSeries[numSquares - j-1];
          // }
          this.notePattern[i] = noteSeries[numSquares - j-1];
          break;
        } else {
          this.notePattern[i] = null;
        }
      }
    }
  }
  
  setSize(newNumSquares){
    numSquares = newNumSquares
    squareLength = cnvSIZE/numSquares
    rectSize = cnvSIZE/numSquares
    for(let i = 0; i < numSquares; i++){
      noteSeries[i] = 60 + EQUALINTERVAL*i;
    }
    this.initializeSelected();
    this.clear()
  }
}

