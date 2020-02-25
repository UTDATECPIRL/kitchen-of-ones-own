import numpy as np
import pandas as pd
import ffmpeg
import math
import os.path
import sys
from os import path

clip_log = {};

def make_clip_file_from_action(row):
	outfile_name = "clips/actions/%s_%s_%s.MP4" % ( row['verb'], row['noun'], row['video_id'] )
	print("clipping %s from %d tp %d" % ( outfile_name, row['start_frame'], row['stop_frame']))
	if (path.exists(outfile_name)):
		print("ignoring %s" % outfile_name)
		return
	(
		ffmpeg
		.input( "EPIC_KITCHENS_2018/videos/train/%s/%s.MP4" % (row['participant_id'], row['video_id'] ))
		.trim(start_frame=row['start_frame'], end_frame=row['stop_frame']) # 
		.setpts ('PTS-STARTPTS')
		.output(outfile_name) # 
		.run()
	)	

def make_timed_clips(row):
	for time in (10, 20, 30):
		outfile_name = "clips/timed_%d/%s_%s_%s.MP4" % ( time, row['verb'], row['noun'], row['video_id'] )
		clip_length = time * 60
		print("clipping %s from %d tp %d" % ( outfile_name, row['start_frame'], row['start_frame'] + clip_length))
		if (path.exists(outfile_name)):
			print("ignoring %s" % outfile_name)
			return
		(
			ffmpeg
			.input( "EPIC_KITCHENS_2018/videos/train/%s/%s.MP4" % (row['participant_id'], row['video_id'] ))
			.trim(start_frame=row['start_frame'], end_frame=row['start_frame'] + clip_length) # 
			.setpts ('PTS-STARTPTS')
			.output(outfile_name) # 
			.run()
		)	

def make_timed_clips_around_verbs(row):
	row['verb'] = row['verb'].replace(':','')
	row['noun'] = row['noun'].replace(':','')
	
	tempfile_name =  "temp/%s_%s_%s_master.MP4" % ( row['verb'], row['noun'], row['video_id'] )
	masterfile_name = "clips/%s_%s_%s_master.MP4" % ( row['verb'], row['noun'], row['video_id'] )
	clip_length = 60 * 60
	start_frame = max(0, row['start_frame'] - clip_length / 2)
	end_frame = start_frame + clip_length
	if (not row['video_id'] in clip_log):
		clip_log[row['video_id']] = { 'start_times' : [], 'first_NV_pair' : "" }

	clip_line = clip_log[row['video_id']]
	if  start_frame in clip_line['start_times']:
		print(clip_line['first_NV_pair'], "is already showing", row['verb'], row['noun'], row['video_id'],start_frame, clip_line['start_times'])
		# probably want to make symlinks but skip for now
		return
	clip_line['start_times'].append(start_frame)
	clip_line['first_NV_pair'] = masterfile_name

	if (path.exists(masterfile_name)):
		# May want to allow multiple versions of the same noun:verb pairs
		print("ignoring %s" % masterfile_name)
		return
	if (path.exists(tempfile_name)):
		# May want to allow multiple versions of the same noun:verb pairs
		print("restarting %s" % tempfile_name)
		os.remove(tempfile_name)
		return
	print(row)
	print("clipping %s from %d tp %d" % ( masterfile_name, start_frame, end_frame))
	try:
		clipped_file_reader, _ = (
			ffmpeg
			.input( "EPIC_KITCHENS_2018/videos/train/%s/%s.MP4" % (row['participant_id'], row['video_id'] ))
			.trim(start_frame=start_frame, end_frame=end_frame) # 
			.setpts ('PTS-STARTPTS')
			.filter('fps', fps=30, round='up')
			.output(tempfile_name) # 
			.run(quiet=False)
		)	
	except:
		print("source video read fail skipping",masterfile_name, sys.exc_info()[0])
		return
	print('writing master')
	try:
		master_file_writer = (
			ffmpeg
			.input(tempfile_name)
			.crop(353,0,1214,1080, keep_aspect='0', exact='1')
			.output(masterfile_name)
			.run(quiet=True)
		)	
	except:
		print("source master write fail skipping",masterfile_name, sys.exc_info()[0])
		return
		
	time = 30 # 10, 20, 
	root_dir = "web/clips/timed_%d" % time
	outfile_name = "%s/%s_%s_%s_1up.MP4" % (root_dir, row['verb'], row['noun'], row['video_id'] )
	clip_length = time * 30
	start_frame = 0 #max(0, row['start_frame'] - clip_length / 2)
	end_frame = start_frame + clip_length
	print("resizing %s from %s for time %d seconds" % ( outfile_name, masterfile_name, time))
	if (path.exists(outfile_name)):
		print("ignoring %s" % outfile_name)
		return
	split0 = (
		ffmpeg
		.input(masterfile_name)
		.trim(start_frame=start_frame, end_frame=end_frame)
		.filter_multi_output('split')
	)
	
	print("making", outfile_name)
	scale_writer_1up = split0.stream(0)
	scale_writer_1up.filter('scale', size='3072x2732').output(outfile_name).run(quiet=True)
	
	outfile_name = "%s/%s_%s_%s_2up.MP4" % ( root_dir, row['verb'], row['noun'], row['video_id'] )
	print("making", outfile_name)

	scale_writer_2up = split0.stream(1)
	scale_writer_2up.filter('scale', size='1536x1366').output(outfile_name).run(quiet=True)
	
	outfile_name = "%s/%s_%s_%s_4up.MP4" % ( root_dir, row['verb'], row['noun'], row['video_id'] )
	print("making", outfile_name)
	scale_writer_4up = split0.stream(2)
	scale_writer_4up.filter('scale', size='768x684').output(outfile_name).run(quiet=True)
	
	
	outfile_name = "%s/%s_%s_%s_8up.MP4" % ( root_dir, row['verb'], row['noun'], row['video_id'] )
	print("making", outfile_name)
	scale_writer_8up = split0.stream(3)
	scale_writer_8up.filter('scale', size='384x342').output(outfile_name).run(quiet=True)

	
print(sys.version)	
action_db = pd.read_csv("EPIC_train_action_labels.csv", delimiter = ',')
#print(action_db[['participant_id', 'video_id', 'verb', 'noun', 'start_frame', 'stop_frame']])

#rows = action_db[(action_db['verb'].isin( ['open', 'take' ])) ].sort_values(['verb','noun'])
#rows.apply(make_clip_file_from_action, axis=1)
#rows.apply(make_timed_clips_around_verbs, axis=1)

rows = action_db[(action_db['verb'].isin( ['adjust', 'check', 'cut', 
											'empty' , 'fill', 'flip', 
											'insert', 'mix', 'move', 'peel', 
											'pour', 'press' , 'put', 
											'remove', 'scoop', 'shake',
											'squeeze' , 'throw' , 'turn',
											'turn-off' , 'turn-on' , 'wash'     ])) ].sort_values(['verb','noun'])
#rows.apply(make_clip_file_from_action, axis=1)
rows.apply(make_timed_clips_around_verbs, axis=1)


rows = action_db[(action_db['verb'] == 'open') & (action_db['noun'].isin(['fridge', 'door', 'cupboard']))]
#rows.apply(make_timed_clips, axis=1)



