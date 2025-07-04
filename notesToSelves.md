## Notes To Selves


#Multi-client:
We successfully connected one SC Client to a remote server using the BootMyServerToOtherClients.scd

Some things we should probably do:
<ol>
<li> try  different scenarios and document them clearly for eventual collaborators</li>
<li>
	 figure out "panic stop" if someone is doing something really loud by mistake. Possibly: ```Server.default.options.safetyClipThreshold = 1```) </li>
	 
	 
<li>figure out how to find out who is connected? At the moment we have a limit of 2 maxlogins; what should we defrault to? 8? 10? There may be a means for people to connect and specific a name. </li>

<li> various troublebshooting things. Right now ().play; is good but everyone's event would sound the same so perhaps we have a way for each client to have a different sound? Can we query what a client number is and use that nmber (e.g. freq: (100* clientnum)
</li>

</ol>
	
	
From the docs: *"scsynth will automatically give a different clientID to each client when it logs in"*




[^1]: This may be one approach:
```
/* -------------------
    LOUDNESS SAFETY: add to your  startup file.
*/ ------------------
Server.default.options.safetyClipThreshold = 1
```

# Possibly Useful Note on SynthDef Timing:

Nathan Ho has a really interesting tips entitled *Always wrap Synth.new and Synth:set in Server.default.bind* on this page: [https://nathan.ho.name/posts/supercollider-tips/](https://nathan.ho.name/posts/supercollider-tips/)

From what I understand from first reading, this changes the OSC messages sent to the server to schedule OSC messages in a more precise using a \latency key. Or something. Investigat further.