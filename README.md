
# Stylish Text

This flutter package contains few custom animated text.



![Demo GIF](https://github.com/dv-mahbub/file/blob/main/stylish_text/All.gif?raw=true)


## Roadmap

- TypewriterText()
- LinearMovingText()
- BounceText()
- OscillateText()
- FadeText()

# Typewriter

![Demo GIF](https://github.com/dv-mahbub/file/blob/main/stylish_text/Typewriter.gif?raw=true)

Example code:

```bash
  TypewriterText(
            'Dhaka is the capital city of Bangladesh',
            style: TextStyle(fontSize: 20, color: Colors.green),
         ),
```

## LinearMoving
![Demo GIF](https://github.com/dv-mahbub/file/blob/main/stylish_text/Linear.gif?raw=true)

Example Code:
```bash
  LinearMovingText(
            'Welcome to Naogaon',
            style: const TextStyle(fontSize: 20, color: Colors.blue),
            direction: Direction.utd,
        ),
```
4 direction available:
Direction.utd, Direction.dtu, Direction.rtl, Direction.ltr

## Bounce
![Demo GIF](https://github.com/dv-mahbub/file/blob/main/stylish_text/Bounce.gif?raw=true)

Example Code:
```bash
  BounceOutText(
        'Flutter project',
        style: const TextStyle(fontSize: 20, color: Colors.purple),
        direction: Direction.dtu,
    ),
```

## Oscillate

![Demo GIF](https://github.com/dv-mahbub/file/blob/main/stylish_text/Oscillate.gif?raw=true)

Example Code:
```bash
  OscillateText(
      'This is Oscillating Text',
       textDirection: TextDirection.ltr,
       style: TextStyle(fontSize: 20, color: Colors.blue),
    ),
```

## Fade
![Demo GIF](https://github.com/dv-mahbub/file/blob/main/stylish_text/Fade.gif?raw=true)

Example Code:
```bash
 FadeText(
    'Hello World!',
     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.redAccent),
    ),
```
