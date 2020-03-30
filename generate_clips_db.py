import os
from pathlib import Path

#database = open('web/epickitchens_clips_db.txt', 'w')
database = open('web lost narratives/epickitchens_clips_db.txt', 'w')
database.write('filename	verb	noun\n')

#os.chdir('web/clips/timed_30')
os.chdir('web lost narratives/clips/timed_30')
p = Path('.')
verb = 0
noun = 1
bigvideos = list(p.glob('*1up.MP4'))
for vid in bigvideos:
	name_parts = vid.stem.split('_')[:-1]
	true_stem = '_'.join(name_parts)
	size_collection  = list(p.glob(true_stem + '*up.MP4'))
	if (len(size_collection) == 4):
		database.write(true_stem + '	' + 
			name_parts[verb] + '	' + 
			name_parts[noun] + '\n')
	else:
		print("oops wrong set of videos:", size_collection)
