let xpos = 0
let ypos = 0
function draw() {
  rect(xpos, ypos,rectSize,rectSize)
  xpos+=rectSize
  if (xpos >= cnvSIZE){
    xpos = 0
    ypos += rectSize
  }  
  if (ypos >= cnvSIZE){
    // stroke('red')
    // line(halfBoard*squareLength,0,halfBoard*squareLength,cnvSIZE)
    // stroke('black')
    noLoop()
  }
}

function mousePressed(){
  if (mouseX > cnvSIZE || mouseY > cnvSIZE){
    return;
  }
  grid.mousePressed();
//   let selectedSquare = [floor(mouseX/squareLength), floor(mouseY/squareLength)]
  
//   if(selected[selectedSquare[0]][selectedSquare[1]]){
//     fill ('white')
//     rect(selectedSquare[0] * squareLength, selectedSquare[1] * squareLength, rectSize,rectSize)
//     selected[selectedSquare[0]][selectedSquare[1]] = false
    
//   } else {
//     clearColumn(selectedSquare[0])
//     fill ('red')
//     rect(selectedSquare[0] * squareLength, selectedSquare[1] *               squareLength,rectSize,rectSize)
//     fill (255)
//     selected[selectedSquare[0]][selectedSquare[1]] = true
//   }
}

// function keyPressed() {
//   playGrid()
// }

