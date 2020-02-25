import ffmpeg

import ffmpeg
split = (
	ffmpeg
	.input('clips/open_bag_P01_09_master.MP4')
	.filter_multi_output('split')
)
split0 = split.stream(0)
split1 = split.stream(1)
split0.output('split0.mp4').run
split1.output('split1.mp4').run()
