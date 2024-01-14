import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
/*Building My Xylophone code using flutter is so much fun. 
I have never thought that building a mini piano in mobile is just like this.
I thought Im gonna pressured over this but I enjoyed it so much.

Let's talk about how I built and what part of am having difficulties with.
Lets get started with the most important but tend to be ignored, The dependencies.
On the first code of copying the video, his version was outdated. My VSCode wants me
to update it in new recent version of audioplayers which is ^5.2.1 so I did changed it.

After following along with the indian guy on the video and he used buildKey. 
Before these code, My code before was not like this. I just manually write expanded and then 
make a textbutton of the each sounds, so I wrote those code seven times. It's because
I thought first that the reason why my VS Code is not working with the indian guy on the video
is because it is outdated, But it is not. 

I took the challenge again to make that outdated version to work. 
I followed his code, used hid builtKey function, the one expanded widget. But now 
I discovered what was wrong, It was AudioCache and the import. 
I think that right now, the version of audioplayers is much easy and compiled.
So, I changed the AudioCache to AudioPlayer() it is because I saw the documentation.
Im kinda feel like genius that I finally solved what i've been getting sad for, it's because of that AudioCache()

After that, the color buttons are not displaying, The sounds is working but the colors are not working.
I started to search and used all my resources to use. I found out that Button style class represents the visual style of a button
after that I also discovered the MaterialSTateProperty is to provide the builtkey value in my parameter color color and int soundNumber
After I finished the code and it works well I realized that this code is much better and faster.
I'm not familiar to Data Structures but it kinda looks like a hashmap in that MaterialStateProperty to me.
I still have a lot to learn and the technology is so wide and broad but now Im thinking
and cosider being a mobile developer after our proffesor introduced flutter.



*/
void main() => runApp(Xylophone());

class Xylophone extends StatelessWidget {
  //AUDIPLAYER CODE HERE
  //we are coding this method para di na pauli uli every textbutton
  void playSound(int soundNumber) {
    final player = new AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  //displaying the color buttons to be pressed here
  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          //calling the playsound method so if it pressed the function of playsound will be played
          playSound(soundNumber);
        },
        //adding this would make the colors appear!hihi
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        //instead of using child: text() we go child:Container.
        //it doesnt matter what property of child it is but we are needing child for textbutton to make it happen
        child: Container(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            // here comes the expanded buildkey(required Color color, required int soundNumber)
            buildKey(color: Colors.red.shade900, soundNumber: 1),
            buildKey(color: Colors.orange.shade900, soundNumber: 2),
            buildKey(color: Colors.yellow.shade900, soundNumber: 3),
            buildKey(color: Colors.green.shade900, soundNumber: 4),
            buildKey(color: Colors.purple.shade900, soundNumber: 5),
            buildKey(color: Colors.indigo.shade900, soundNumber: 6),
            buildKey(color: Colors.blue.shade900, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
