

Language: Unity3D using C#

Goal: Allow second user to see the minimap using a AR phone.

Approach: Used an augment reality SDK and tag on a table, then project the mini map content on top.

While one player uses the HTC vive tracked controllers to build a fort, as in the VR mini map, another user can view the fort. This is achieved with two separate programs, the VR fort demo and a phone viewer. For development I used a webcam attached to my computer for the phone. The "phone" viewer is also written in Unity3d with the help of the ARToolkit. This worked for under Idea circumstances but ultimately was not meant for Unity.



I switch over to Vuforia. This is SDK I saw an a /r/Unity3D and has much better Unity support. It is a Natural Feature Tracking solution. That does the preprocessing phase on the web, giving you a .unitypackage with the tracking info. For the tag, I lack a printer, so I made my own with some paint and heavy stock I had laying around.



When the "phone" boots up, it sends connects to the server over .Net.Sockets. The server logs this client connection and sends any already placed items. The "phone" renders this place items based of the location of the Tag. The result is a way for a "little brother" to watch the player build.



The Network communication right now is hardcoded IPs. This is good in a test environment but should be switched to another solution. Possibly the VR host displaying a QR code with the host IP, being that this is only meant for LAN.



While developing my communication format, I created a 2 WPF application for debugging. The first acted as a "fake" server, it send all the same massages but control the inputs by sliders. The second acted as a "fake" client, it posted all the incoming messages to a textbox, allowing a clear view of what is received. This server code was then shared with Unity3D for use with the VR setup. This allowed my to mix and match what server and client(s) I used.



This two WPF used NewtonSoft JSON.net for my serialization, which is not supported by Unity3D because of a .net version miss-match. For the Unity3D end, I used the lightweight JsonUtility built in to Unity3D. This utility only allowed for structed Json, so I made a new sturct that only had message type and payload as variables. This meant that I could send the incoming message off to the right parser in Unity.