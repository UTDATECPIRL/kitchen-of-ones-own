import ffmpeg
import sys

masterfile_name = 'pipetest.mp4'
try:
	split = (
		ffmpeg
		.input( "EPIC_KITCHENS_2018/videos/train/P01/P01_01.MP4")
		.trim(start_frame=0, end_frame=300) # 
		.setpts ('PTS-STARTPTS')
		.filter('fps', fps=30, round='up')
		.filter_multi_output('split')

	)	
except:
	print("source video read fail skipping",masterfile_name)
	sys.exit(0)

# split = (
# 	ffmpeg
# 	.input('pipe:', format='rawvideo', s='{}x{}'.format(1214, 1080))
# 	.filter_multi_output('split')

# 	)
#split.communicate(input=out)
split0 = split.stream(0)
split1 = split.stream(1)
split2 = split.stream(2)
split3 = split.stream(3)
split0.filter('scale',size='3072x2732').output('split0.mp4').run(quiet=True)

split1.output('split1.mp4').run(quiet=True)

split2.filter('scale',size='384x342').output('split2.mp4').run(quiet=True)

split3.output('split3.mp4').run(quiet=True)


# master_file_writer = (
# 	ffmpeg
# 	.input('pipe:', format='rawvideo', s='{}x{}'.format(1920, 1080) )
# 	.crop(353,0,1214,1080, keep_aspect='0', exact='1')
# 	.output(masterfile_name)
# 	.run_async(pipe_stdin=True)
# )
# master_file_writer.communicate(input=out)