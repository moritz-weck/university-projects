# One Night at Coffees

## English

### Where to play the game
The game can be played on <a href="https://moritzmoritz.itch.io/one-night-at-coffees">itch.io</a>. Alternatively, it is possible to open the project in Godot 4. <br>

### Project Summary
The task we were given was simply “Make a Game.” Although there were a few features that granted bonus points (3D, collisions, particles), there were no other requirements, giving us complete creative freedom in designing the game. <br>
The project was developed by a group of four students. The result is a game in the visual novel genre with light horror and puzzle elements. <br>
The game has a 2.5D style. The main environment consists of 3D models, but the sprites used for the customers are 2D. We applied billboard properties so that they function properly in a 3D environment. This design choice was inspired by the Danganronpa series. <br>

### Tools Used
I used Godot 4 and the GDScript programming language.
Other team members also used Blender.

### Instructions & Software Features
In the 3D environment the player can move using W-A-S-D and interact with the customers by pressing E, playing different dialogues depending on the drink the player has made. The player is also able to access the coffee-creating minigame by interacting with the coffee machine. <br>
In the minigame, the player can create the drinks they serve the customers. The player can create 8 types of drinks: nothing, milk, chocolate latte, vanilla latte, strawberry latte, coffee with 0-2 pumps of milk. The minigame uses simple drag-and-drop mechanics. <br>
The player has to interpret the orders of the customers to figure out which drinks need to be made to progress the story. Sometimes the player needs to make similar drinks, because the
ordered drink can’t be made, or they need to decipher binary. <br>
The fifth customer of the game displays the main obstacle of the game, which leads to different endings. Depending on whether the player can serve the customer in a limited time,
the game either jumps immediately to the bad ending screen, or continues with the story before jumping to the good ending screen. <br>
The game also contains a main menu and settings, in which the player can adjust the volume of the game and the mouse sensitivity for the movement in the 3D-environment.

### My Role in the Project
In this project, I was responsible for the software implementation. While my teammates worked on the story and assets, including the 3D environment, I worked extensively with Godot and implemented nearly all functionalities, except for the imported add-on and the scripts coffee_machine_3d.gd, interaction_script.gd, and parts of npc_entrance.gd. <br>
I also implemented and, when necessary, revised the dialogues.

### Project Reflection
Thanks to the clear division of tasks, teamwork went smoothly. Although the game doesn’t feel completely finished due to the limited time frame, I believe it represents a solid fulfillment of the assignment. <br>
It is important to note that, due to the small scope of the game, the implementation is not designed for scalability. For example, all four NPCs were implemented individually, which would not have been feasible with a larger number. <br>

### Used Files
All 2D textures were self-made, many of them hand-drawn. <br>
The 3D environment was made by <a href="https://sketchfab.com/fangzhangmnm">fangzhangmnm</a> and can be found on <a href="https://sketchfab.com/3d-models/anime-cafe-1d4f3b7b7d5842d993fe2775d57aa33f">Sektchfab</a>. <br>
We also used the <a href="https://github.com/nathanhoad/godot_dialogue_manager">Godot Dialogue Manager</a> by <a href="https://github.com/nathanhoad">nathanhoad</a>.

---

## German

## Wo man das Spiel spielen kann
Das Spiel kann direkt auf <a href="https://moritzmoritz.itch.io/one-night-at-coffees">itch.io</a> gespielt werden. Alternativ ist es auch möglich, das Projekt direkt in Godot 4 zu öffnen. <br>

### Zusammenfassung des Projektes
Die uns gegebene Aufgabenstellung war "Make a Game.". Es gab zwar ein paar Eigenschaften, für die es Bonuspunkte gab (3D, Kollisionen, Partikel), sonst gab es aber keine Anforderungen und vollständige kreative Freiheiten bei der Erstellung eines Spiels. <br>
Das Projekt wurde in einer Gruppe von vier Studierenden erstellt. Entstanden ist ein Spiel des Genres Visual Novel mit leichten Horror- und Puzzleelementen. <br>
Das Spiel besitzt einen 2,5D-Stil. Die Hauptumgebung besteht aus 3D-Modellen, aber die für die Kunden verwendeten Sprites sind 2D. Wir haben Billboard-Eigenschaften angewendet, sodass sie in einer 3D-Umgebung funktionieren. Diese Designentscheidung wurde von der Danganronpa-Spielreihe inspiriert.

### Verwendete Werkzeuge
Es wurden Godot 4 und die Programmiersprache GDScript verwendet. <br>
Andere Personen im Team haben zudem Blender verwendet. <br>

### Anleitung & Funktionen der Software
In der 3D-Umgebung kann sich der Spieler mit W-A-S-D bewegen und durch Drücken der Taste E mit den Kunden interagieren, wobei je nach vom Spieler zubereitetem Getränk unterschiedliche Dialoge abgespielt werden. Der Spieler kann außerdem das Kaffeezubereitungs-Minispiel aufrufen, indem er mit der Kaffeemaschine interagiert. <br>
Im Minispiel kann der Spieler die Getränke herstellen, die den Kunden serviert werden. Der Spieler kann acht Getränkesorten zubereiten: Leeres Getränk, Milch, Schokoladenlatte, Vanillelatte, Erdbeerlatte sowie Kaffee mit 0–2 Spritzern Milch. Das Minispiel verwendet einfache Drag-and-Drop-Mechaniken. <br>
Der Spieler muss die Bestellungen der Kunden interpretieren, um herauszufinden, welche Getränke hergestellt werden müssen, um in der Geschichte voranzuschreiten. Manchmal muss der Spieler ähnliche Getränke zubereiten, weil das bestellte Getränk nicht hergestellt werden kann, oder er muss Binärcode entschlüsseln. <br>
Der fünfte Kunde des Spiels stellt das Haupthindernis dar, das zu unterschiedlichen Enden führt. Je nachdem, ob der Spieler es schafft, den Kunden innerhalb eines begrenzten Zeitraums zu bedienen, springt das Spiel entweder direkt zum schlechten Ende oder setzt die Geschichte fort, bevor es zum guten Ende übergeht. <br>
Das Spiel enthält außerdem ein Hauptmenü und Einstellungen, in denen der Spieler die Lautstärke des Spiels und die Maus­empfindlichkeit für die Bewegung in der 3D-Umgebung anpassen kann. <br>

### Eigene Rolle im Projekt
In diesem Projekt war ich für die Implementation der Software verantwortlich. Während meine Teammitglieder sich um die Story und Assets inklusive der 3D-Umgebung gekümmert haben, habe ich intensiv mit Godot gearbeitet und mit Ausnahme des importieren Add-Ons und von coffee_machine_3d.gd, interaction_script.gd und Teilen von npc_entrance.gd jegliche Funktionen implementiert. <br>
Außerdem habe ich die Dialoge implementiert und gegenfalls überarbeitet. <br>

### Reflexion des Projektes
Durch die klare Aufgabenverteilung hat die Arbeit im Team gut funktioniert. Das Spiel fühlt sich aufgrund des limitierten Zeitrahmens zwar nicht komplett fertig an, stellt aber eine meines Ermessens nach gute Erfüllung der Aufgabenstellung dar. <br>
Wichtig anzumerken ist, dass aufgrund der kleinen umfang des Spiels, die Implementation nicht auf Skalierbarkeit ausgelegt ist. So sind z.B. alle vier NPCs einzeln implementiert, was bei eine größeren Anzahl keine sinnvolle Umsetzung gewesen wäre. <br>

### Verwendete Dateien
Jegliche 2D-Texturen sind selbstgemacht, viele davon mit der Hand gezeichnet. <br>
Die 3D-Umgebung wurde von <a href="https://sketchfab.com/fangzhangmnm">fangzhangmnm</a> erstellt und kann auf <a href="https://sketchfab.com/3d-models/anime-cafe-1d4f3b7b7d5842d993fe2775d57aa33f">Sektchfab</a> gefunden werden. <br>
Es wurde außerdem der <a href="https://github.com/nathanhoad/godot_dialogue_manager">Godot Dialogue Manager</a> von <a href="https://github.com/nathanhoad">nathanhoad</a> verwendet.
