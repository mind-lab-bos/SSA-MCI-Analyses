// register the audio worklet processor
const audioContext = new AudioContext();
await audioContext.audioWorklet.addModule('path/to/audio-worklet-processor.js');

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

  // create a new AudioWorkletNode for each note
  const awn = new AudioWorkletNode(audioContext, 'js/sound-file-processor.js');

  // connect the AudioWorkletNode to the output
  awn.connect(audioContext.destination);

  // send the note frequency to the AudioWorkletNode
  awn.port.postMessage({
    type: 'frequency',
    value: note
  });

  // start the AudioWorkletNode
  awn.port.postMessage({
    type: 'start'
  });

  // stop the AudioWorkletNode after a duration of 0.1 seconds
  awn.port.postMessage({
    type: 'stop',
    value: timeFromNow + 0.1
  });
}
