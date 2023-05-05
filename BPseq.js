// class P {
//   setup(){
//         this.canvas = this.createCanvas(500, 500)
//         this.canvas.position(600,600)
//         this.background(220);
//       }
// }

// class Rating {
//   constructor(num){
    
//   }
// }
r = function(p){
  let cnvPos = cnvSIZE+200
  p.setup = function(){
    p.canvas = p.createCanvas(cnvSIZE, cnvSIZE)
    p.canvas.position(0,cnvPos)
    p.background(255);
  }
}

q = function(p){
  let textsize = p.round(cnvSIZE/50*1.5)
  let ratings = []
  let cnvPos = cnvSIZE+300
  p.setup = function(){
    p.canvas = p.createCanvas(cnvSIZE, cnvSIZE)
    p.canvas.position(0,cnvPos)
    p.background(255);
    p.saveData = p.createButton('save data')
    p.saveData.position(0,cnvPos+cnvSIZE)
    p.saveData.mousePressed(p.writeFile)
    for(let i = 1; i < patternButtons.length; i++){
      ratings.push(new p.Rating(i))
    }
  }

  p.draw = function(){
    p.background(255)
    if(resetSketch){
      p.clearSketch();
    }
    for (let i = 0; i < ratings.length; i++){
      ratings[i].draw();
    }
  }
  p.clearSketch = function(){
    for (let i = 0; i < ratings.length; i++){
      ratings[i].slider.remove();
    }
    ratings = [];
    for(let i = 1; i < patternButtons.length; i++){
          p.textSize(round(textsize))
          p.textAlign(LEFT,TOP)
          p.text("preset " + i + " rating:", 50,(i-1)*(textsize)*2+cnvSIZE/10)
          ratings.push(new p.Rating(i))
      }
    p.background(255);
    resetSketch = false;
  }
  p.Rating = function(num){
    this.slider = p.createSlider(0,100,50)
    this.slider.position(200, cnvPos + (num-1)*(textsize)*2+cnvSIZE/10)
    this.score = this.slider.value();
    this.pattern = p.getItem("preset"+num);
    this.draw = function(){
      //p.background(255)
        p.textSize(round(textsize))
        p.textAlign(LEFT,TOP)
        p.text("preset " + num + " rating:", 50,(num-1)*(textsize)*2+cnvSIZE/10)
      this.score = this.slider.value();
      p.text(this.score, 400,(num-1)*(textsize)*2+cnvSIZE/10)
    }
  }
  p.getPattern = function(selections){
    this.noteArray = []
    this.gridlength = selections.length
    this.selected = false;
    for (let i = 0; i < this.gridlength; i++){
      this.selected = false;
      for (let j = 0; j < selections[0].length; j++){
        if (selections[i][j]){
          this.noteArray.push(this.gridlength - j);
          this.selected = true;
          break;
        }  
      }
      if (!this.selected){
        this.noteArray.push(0);
      }
    }
    return this.noteArray;
  }
  p.formatRatingList = function(ratingIndex){
    let list = [];
    list.push(ratingIndex+1);
    list.push(p.getPattern(ratings[ratingIndex].pattern));
    list.push(ratings[ratingIndex].score)
    return list;
  }
  p.writeFile = function(){
    // let writer = p.createWriter('newFile.txt');
  // write 'Hello world!'' to the file
  // writer.write(['Hello world!']);
  //   writer.write()
    let list1 = [];
    // console.log(p.getPattern(ratings[0].pattern))
    for(let i = 0; i<ratings.length; i++){
      // list1.push(p.getPattern(ratings[i].pattern))
      list1.push(p.formatRatingList(i));
    }
    p.saveStrings(list1,'data.txt')
  // close the PrintWriter and save the file
    // writer.close();
  }
  // p.removeSliders = function(){
  //   for (let i = 0; i < ratings.length; i++){
  //     ratings[i].removeSlider();
  //   }
  // }
}

// sketch = new p5(q)

// function makeCanvas(color){
//   let pole = function(p){
//       p.setup = function (){
//         p.canvas = p.createCanvas(600, 600)
//         p.canvas.position(0,700)
//         p.background(color);
//         //p.slider = p.createSlider(0,100,50)
//         p.textSize(50)
//         p.fill(0)
//         p.strokeWeight(5)
//         p.stroke(10);
        
//         p.rect(50,50,500,500)
//         p.fill(255)
//         p.text('hello World',50,50)
//         for(let i = 0; i < patternButtons.length+1; i++){
//           p.text(i+1, 50,i*10+100)
//         }
//       }
//       // p.draw = function(){
//       //   if (p.mouseIsPressed){
//       //     if (p.keyIsPressed){
//       //       p.fill(255-p.mouseX,255-p.mouseY,p.mouseY)
//       //     } else {
//       //       p.fill(p.mouseX,p.mouseY,p.mouseX+p.mouseY)
//       //     }
//       //     p.rect(p.mouseX,p.mouseY,50,50)
//       //   }  
//       // }
//       // // p.mousePressed = function(){
//       // //   p.background(random(255))
//       // //   p.fill(255-p.mouseX,255-p.mouseY,255-p.mouseX+p.mouseY)
//       // // }
//       // p.keyPressed = function(){
//       //   if (p.keyCode === p.UP_ARROW){
//       //     p.background(random(255))
//       //   }
//       // }
//     p.moreText = function(){
//       p.rect(100,100,80,80)
//     }
//   }
//   return pole;
  
// }

// var p = new P()

// function makeCanvas(q){
//   return q
// }
// class Sketch{
//   constructor(){
//     this.sketch = makeCanvas(q);
//     // this.sketch = function(p){
//     //   // p.setup = function (){
//     //   //   p.canvas = p.createCanvas(500, 500)
//     //   //   p.canvas.position(600,600)
//     //   //   p.background(220);
//     //   // }  
//     // }
//     this.newSketch = new p5(this.sketch);
//   }
// }

// sketch = new Sketch();