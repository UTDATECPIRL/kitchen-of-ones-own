# A Kitchen of One's Own

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

xtine burrough and Sabrina Starnaman
with Technical Direction by Dale MacDonald

*A Kitchen of One's Own*  by xtine burrough and Sabrina Starnaman is a speculative remix that confronts Epic Kitchens, a dataset of first-person cooking videos, with quotes from literature written during or about prior pandemics such as the bubonic plague and the global influenza pandemic of 1918-19. 

*A Kitchen of One's Own* reveals the arbitrary nature of information preservation and highlights the constructed nature of digitised materials. Blurring the lines between art and archive, or information and dataset, this project furthers discourse about the digital dataset as an authority of knowledge curation.



Epic Kitchens (2018) is a dataset of videos collected by a group of researchers to create non-scripted recordings of all daily activities in kitchens. It is the largest known dataset produced using first-person vision. Each recorded action is assigned a verb like wash, peel, toast or rub to describe and categorise the event. A set of videos used for training machine learning were also tagged with nouns to accompany the verbs. In this browser-based poetry project, 74 videos from the Epic Kitchens 2018 database tagged with the noun **hand** and the verb **wash** play for 30 seconds, while a quote is juxtaposed at random. If a viewer holds their cursor over the text, they will see the title of the book, play, or essay to which it is attributed. Clicking on the text advances the narrative to a new video and quote.

This project is published in a Creative Commons license (Zero v1.0 Universal) on Github and the videos are streaming from the Vimeo collection, Epic Hand Washing‚ a sub dataset of videos from Epic Kitchens that have been transformed in size and duration, and re-exported and compressed for streaming online. The navigation at the bottom of the project links to these collections and to a spreadsheet that shows the complete bibliography for the project.

# Links

  - [Epic Hand Washing Collection on Vimeo](http://www.bit.ly/epic-hand-washing) 
  - [Complete Bibliography](http://www.bit.ly/epic-hand-washing-bibliography) 

# How it Works
- You need ffmpeg. (on a Mac you need to use homebrew to get it)
- Download the training set from Epic Kitchens and it database EPIC_train_action_labels.csv 
- modify epickitchens_sized_clips_generator.py to include the verbs you wish to capture, the lengths of clips you want, and the destination you want. We have done a web version *Epic Hand Washing* which in this repository lives in web/ and an installation version for a large, wall-sized display which lives in installation/
- run epickitchens_sized_clips_generator.py in python3.  After 30-40 days, you will have a large library of clips 
- run generate_clips_db.py 

License
----

Creative Commons v1.0 Universal