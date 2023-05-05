let intervalInSeconds = 0.2;
let soundLoop = new p5.SoundLoop(onSoundLoop, intervalInSeconds);
let synth = new p5.MonoSynth();

function playGrid() {
  // retrieve the note pattern from the grid
  grid.getNotePattern();

  console.log(grid.notePattern);

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
  let noteIndex = (soundLoop.iterations - 1) % grid.notePattern.length;

  if (!noteIndex) {
    console.log('LOOP STARTING:');
  }

  let note = grid.notePattern[noteIndex];

  if (note) {
    console.log('MIDI: ' + note);
  }

  note = midiToFreq(note);

  if (note > 100) {
    console.log('Freq: ' + note);
  }

  synth.play(note, 0.5, timeFromNow);
}
