Mercury
=======

Mercury is an admin mod for Garrysmod. It is designed to be more lightweight, and easier to operate than other systems like it. It started off as a two day project, then escalated into an ongoing work.

How to set it up
=======

First, install Mercury into your addons folder, then proceed to start / restart your server. You should see a few messages in console indicating that Mercury has loaded. The initialzied modules will be listed.

After the server has started, you need to join it; when you spawn in, use either RCON or type directly in the server's console to run this


hg rankadd owner Owner 1,1,1


After executing the above, you need to give the rank all privileges, this can be accomplished by running the following in RCON or in the server console.

hg rankmodpriv owner add @allcmds@


Finally, you can set yourself to the rank by using the following command, executed with one of the methods mentioned previously.


hg setrank "your name" owner



After this is done, you can now use your game client to configure more ranks and groups. 

Note, Im not the Creator or Mercury or its Workings, i just fixed it to work better on sandbox servers.
