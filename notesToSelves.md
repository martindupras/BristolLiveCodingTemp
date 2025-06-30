## Notes To Selves

#Multi-client:
We successfully connected one SC Client to a remote server using the BootMyServerToOtherClients.scd

We should:
(1) try it in different scenarios and document it simply for eventual collaborators
(2) Figure out some basic but possibly important things:
	- "panic" stop if someone is doing something really loud by mistake
	- check who is connected? At the moment we have a limit of 2 maxlogins; what should we defrault to? 8? 10?
	- various troublebshooting things. Right now ().play; is good but everyone's event would sound the same so perhaps we have a way for each client to have a different sound? Can we query what a client number is and use that nmber (e.g. freq: (100* clientnum)