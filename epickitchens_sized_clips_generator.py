import pandas as pd
import ffmpeg
import math
import sys
from os import path
import glob
import os
import time
clip_log = {};

print(os.getcwd())

def make_sized_clips_from_masters(masterfile_name):
	#print(masterfile_name)
	basename = masterfile_name.split('/')[1].split('_master')[0]
	print(masterfile_name, basename)
	# return
	
	clip_length_seconds = 30 # 10, 20, 
	root_dir = "installation/clips/timed_%d" % clip_length_seconds
	outfile_name = "%s/%s_1up.MP4" % (root_dir, basename )
	clip_length = clip_length_seconds * 30
	start_frame = 0 #max(0, row['start_frame'] - clip_length / 2)
	end_frame = start_frame + clip_length
	print("resizing %s from %s for time %d seconds" % ( outfile_name, masterfile_name, clip_length_seconds))
	if (path.exists(outfile_name)):
		print("ignoring %s" % outfile_name)
		return
	split0 = (
		ffmpeg
		.input(masterfile_name)
		.trim(start_frame=start_frame, end_frame=end_frame)
		.filter_multi_output('split')
	)
	err = ''
	print("making", outfile_name, "using", split0)
	elapsed_times = [ 0, 0, 0, 0]
	try:
		be_quiet = True
		now = time.perf_counter()
		scale_writer_1up = split0.stream(0)
		foo = scale_writer_1up.filter('scale', size='3072x2732').output(outfile_name).run(quiet=be_quiet)
		elapsed_times[0] = time.perf_counter() - now
		now = time.perf_counter()


		outfile_name = "%s/%s_2up.MP4" % ( root_dir, basename )
		print("making", outfile_name)
		
		scale_writer_2up = split0.stream(1)
		scale_writer_2up.filter('scale', size='1536x1366').output(outfile_name).run(quiet=be_quiet)
		
		outfile_name = "%s/%s_4up.MP4" % ( root_dir, basename )
		print("making", outfile_name)
		elapsed_times[1] = time.perf_counter() - now
		now = time.perf_counter()
		scale_writer_4up = split0.stream(2)
		scale_writer_4up.filter('scale', size='768x684').output(outfile_name).run(quiet=be_quiet)
		
		
		outfile_name = "%s/%s_8up.MP4" % ( root_dir, basename )
		print("making", outfile_name)
		elapsed_times[2] = time.perf_counter() - now
		now = time.perf_counter()
		scale_writer_8up = split0.stream(3)
		scale_writer_8up.filter('scale', size='384x342').output(outfile_name).run(quiet=be_quiet)
		elapsed_times[3] = time.perf_counter() - now
		now = time.perf_counter()
		print(elapsed_times)
	except:
		print("Error: ", err)

print(sys.version)	
#action_db = pd.read_csv("EPIC_train_action_labels.csv", delimiter = ',')
#print(action_db[['participant_id', 'video_id', 'verb', 'noun', 'start_frame', 'stop_frame']])

#rows = action_db[(action_db['verb'].isin( ['open', 'take' ])) ].sort_values(['verb','noun'])
#rows.apply(make_clip_file_from_action, axis=1)
#rows.apply(make_timed_clips_around_verbs, axis=1)

# rows = action_db[(action_db['verb'].isin( ['adjust', 'check', 'cut', 
# 											'empty' , 'fill', 'flip', 
# 											'insert', 'mix', 'move', 'peel', 
# 											'pour', 'press' , 'put', 
# 											'remove', 'scoop', 'shake',
# 											'squeeze' , 'throw' , 'turn',
# 											'turn-off' , 'turn-on' , 'wash'     ])) ].sort_values(['verb','noun'])
#rows = action_db[(action_db['verb'].isin( [ 'wash'     ])) ].sort_values(['verb','noun'])
#rows.apply(make_clip_file_from_action, axis=1)
for clip in glob.glob("clips/*_master.MP4"):
	make_sized_clips_from_masters(clip)


#rows = action_db[(action_db['verb'] == 'open') & (action_db['noun'].isin(['fridge', 'door', 'cupboard']))]
#rows.apply(make_timed_clips, axis=1)



