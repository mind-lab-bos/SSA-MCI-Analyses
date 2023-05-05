let intervalInSeconds = 0.2;
let soundLoop = new p5.SoundLoop(onSoundLoop, intervalInSeconds);
let synth = new p5.MonoSynth();

// let notepattern = []
// for (let i = 0; i < numSquares; i++){
//   notepattern[i] = null
// }

function playGrid(){
  // getNotePattern()
  grid.getNotePattern();
  console.log(samples);
  console.log(grid.notePattern)
   //the looper's callback is passed the timeFromNow
   //this value should be used as a reference point from
   //which to schedule sounds

  
  // ensure audio is enabled
  userStartAudio();

  if (soundLoop.isPlaying) {
    soundLoop.stop();
  } else {
    // start the loop
    soundLoop.start();
  }
}

function onSoundLoop(timeFromNow) {
  // let noteIndex = (soundLoop.iterations - 1) % notepattern.length;
  let noteIndex = (soundLoop.iterations - 1) % grid.notePattern.length;
  if (!noteIndex){
    console.log('LOOP STARTING:')
  }
  // let note = notepattern[noteIndex]
  let note = grid.notePattern[noteIndex]
  if (note){
  console.log('MIDI: ' + note)
  }
  note = midiToFreq(note);
  if (note > 100){
  console.log('Freq: ' + note)
  }
  synth.play(note, 0.5, timeFromNow);
} 

// function getNotePattern(){
//   for (let i = 0; i < numSquares; i++){
//     for (let j = 0; j < numSquares; j++){
//       if (selected[i][j]){
//         if (i > halfBoard){
//           notepattern[i] = round(noteSeries[numSquares - j-1]);
//         } else {
//           notepattern[i] = noteSeries[numSquares - j-1];
//         }
//         break;
//       } else {
//         notepattern[i] = null;
//       }
//     }
//   }
// }