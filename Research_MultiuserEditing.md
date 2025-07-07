#Research - Multiuser editing for live coding in supercollider


## Good leads
### Troop
Best candidate so far if we can make it work.

[GitHub](https://github.com/Qirky/Troop)


One possibility is to run the MacOS executable (see "V0.7.5" [here](https://github.com/Qirky/Troop/releases?page=2)) That may solve the python version problem. 

*MD: I had a go but I get error:*

``` 
Error loading Python lib 
```

*Maybe Guy can figure it out, seems far more experienced with Pythong than I am.*


### scnvim + tmux + instant.nvim

According to this [thread](https://scsynth.org/t/sc-in-the-browser/7995/4) on scsynth.org:

*using terminal with scnvim + tmux + instant.nvim GitHub - jbyuki/instant.nvim: collaborative editing in Neovim using built-in capabilities*

[GitHub link to instant.nvim](https://github.com/jbyuki/instant.nvim)


### Etherpad

Browser-based, open-source, cross-platform, servable on local network.

[site](https://etherpad.org/#)

[GitHub](https://github.com/ether/etherpad-lite)

[Live test server](https://etherpad.wikimedia.org/p/martintest)










## Leads found to be not helpful

### SuperCopair
Can't find resources newer than 2015. Seems to rely on Atom.io, now discontinued (as best as I can tell.)

### tmux + ssh
Looks quite fiddly and fragile; not everyone is adept at vi which is probably the only viable editor in this scenario.

### Teletype for Atom
Atom looks crossplatform and open source, but seems to be discontinued since 2022. 

### Estuary	
Looks good but unclear whether suitable for SuperCollider. 

[paper](https://iclc.toplap.org/2017/cameraReady/ICLC_2017_paper_78.pdf)

[site](https://estuary.mcmaster.ca/)


### CodeNest
Really unclear license, and seems to need registering before doing anything. So... no.
[site](https://www.phdeck.com/product/codetogether-2?utm_source=chatgpt.com)


## Related reading:

### Ryan Kirkbride's PhD Dissertation:

[Collaborative Interfaces for
Ensemble Live Coding
Performance](https://etheses.whiterose.ac.uk/id/eprint/28901/1/Collaborative_Interfaces_for_Ensemble_Live_Coding_Performance%20-%20resubmission.pdf)