// Full rotation
// in radians, handy to store these in readable variables
const fullRotation = Math.PI * 2;

// Half rotation
// in radians, handy to store these in readable variables
const halfRotation = Math.PI;

// Ease in out cubic
// Easings specify the rate at which an animation happens over time.
// Ease in out is a curve with a slower entrance, a faster middle and
// a slower exit, making animations *ease* into and out of their movement.
function easeInOutCubic(t) {
  return t < 0.5 ? 4 * t * t * t : (t - 1) * (2 * t - 2) * (2 * t - 2) + 1;
}

// Clamp
// Takes a value, a min and a max, if the value is less than the min
// it will set the value to the min and if the value is greater than
// the max it will set the value to the max
// e.g. clamp(11, 0, 10) would return 10
// e.g. clamp(9, 0, 10) would return 9
function clamp(input, min, max) {
  return Math.max(min, Math.min(input, max))
}

// Map range
// Re-maps a number from one range to another. eg. https://processing.org/reference/map_.html
// (nb: numbers are not clamped by default to min and max parameters)
// e.g. map(70, 0, 100, 0, 10) would return 7
// e.g. map(70, 0, 100, 10, 20) would return 17
function map(value, low1, high1, low2, high2) {
  return low2 + ((high2 - low2) * (value - low1)) / (high1 - low1);
}

// do both of the above! map and clamp together!
// e.g. mapAndClamp(70, 0, 100, 0, 10) would return 7
// e.g. mapAndClamp(70, 0, 100, 10, 20) would return 17
// e.g. mapAndClamp(110, 0, 100, 10, 20) would return 20, not 21, as it's clamped to 20 max
function mapAndClamp(value, low1, high1, low2, high2) {
  return clamp(
    map(value, low1, high1, low2, high2),
    Math.min(low2, high2),
    Math.max(low2, high2)
  )
}

// Random number within range
// Generates a random number between min and max rounded
// e.g. randomNumber(10, 20) could return 17.12335
function randomNumber(min, max) {
  return Math.random() * (max - min) + min
}

// Random number within range
// Generates a random number between min and max rounded
// e.g. randomRoundNumber(10, 20) could return 17
function randomRoundNumber(min, max) {
  return Math.round(randomNumber(min, max))
}











const container = document.querySelector("section.animation")

 console.log('script is initial loaded');

const params = {
  width: 500,
  height: 500
}

const two = new Two(params)
two.appendTo(container)


// config for our animation
const numberOfShapes = 25
const shapes = []
const loopDuration = 6 * 60
const aDelay = 0.0025


// make shapes
for (let i = 0; i < numberOfShapes; i++) {
  const size = 20
  const sx = size * i + 10
  const sy = 250
  const sr = 0
  const ss = 1
  const ex = randomNumber(50, 450)
  const ey = randomNumber(50, 450)
  const er = randomNumber(-2 * fullRotation, 2 * fullRotation)
  const es = randomNumber(0.5, 1.5)

  const shape =two.makeRectangle(sx, sy, size, size)
  shape.noStroke()
  shape.fill = "#FFFFFF"
  shape.data = {
    sx: sx,
    sy: sy,
    sr: sr,
    ss: ss,
    ex: ex,
    ey: ey,
    er: er,
    es: es

  }

  shapes.push(shape)
}

two.bind("update", function (frameCount) {
  // draw
  const currentFrame = frameCount % loopDuration
  const t = currentFrame / loopDuration

  shapes.forEach((shape, i) => {
    if (currentFrame === 0) {
      shape.data.ex = randomNumber(50, 450)
      shape.data.ey = randomNumber(50, 450)
      shape.data.er = randomNumber(-2 * fullRotation, 2 * fullRotation )
    }

    const aStart = aDelay * (numberOfShapes - i)
    const aEnd = aDelay * i

    let u = 0

    if (t <0.5) {
      u = mapAndClamp(t, aStart, 0.5-aEnd, 0, 1)
    } else {
      u = mapAndClamp(t, 0.5 + aStart, 1-aEnd, 1, 0)
    }

    const cu = easeInOutCubic(u)


    const x = mapAndClamp(cu, 0, 1, shape.data.sx, shape.data.ex)
    const y = mapAndClamp(cu, 0, 1, shape.data.sy, shape.data.ey)
    const r = mapAndClamp(cu, 0, 1, shape.data.sr, shape.data.er)
    const s = mapAndClamp(cu, 0, 1, shape.data.ss, shape.data.es)
    shape.translation.x = x
    shape.translation.y = y
    shape.rotation = r
    shape.scale = s
  })
})

two.play()


 console.log('script is loaded');
