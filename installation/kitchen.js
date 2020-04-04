import { readCSVfile }  from './csvreader.js'

let incomingURL = window.location.href;
console.log(incomingURL);

let database = {};
let videofiles = {};

//fetch('videofiles.txt')
fetch('epickitchens_clips_db.txt')
	.then((response) => {
    	//response => response.clone.text();
		//console.log(response);
		return response.text();
	})
	.then((mydata) => {
		console.log("raw videofiles: " + mydata);
		videofiles = readCSVfile(mydata);
		console.log("videofiles: " + videofiles);
		sortVideoFilesByVerbs(videofiles);
	});

fetch('Epic-Kitchen-Ones-Own-Database.txt')
	.then((response) => {
		return response.text();
	})
	.then((mycsv) => {
		//console.log(mycsv);
		database = readCSVfile(mycsv);
		runExhibit(database);
		//console.log(database);

	});

//let database = readCSVfile('epic-kitchen-ones-own.csv');
console.log("epic-kitchen-ones-own.csv");
console.log(database);

let OneOnFourUp = [

					{ "class": "div-2", "size": "2up" }, {"class": "div-1", "size": "1up" } 
				];
let TwoOnFourUp = [ 
					{ "class": "div-2", "size": "2up" }, { "class": "div-2", "size": "2up" }, 
					{ "class": "div-1", "size": "1up" } 
				];
let FourUp = [  
					{ "class": "div-2", "size": "2up" }, { "class": "div-2", "size": "2up" },
					{ "class": "div-2", "size": "2up" }, { "class": "div-2", "size": "2up" } 
				]; 
let EightUp = [  
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" }, 
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" },  
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" }, 
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" },
					{ "class": "div-2", "size": "2up" }, { "class": "div-2", "size": "2up" }  
				];
let EightDown = [ 
					{ "class": "div-2", "size": "2up" }, { "class": "div-2", "size": "2up" },  
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" }, 
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" },  
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" }, 
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" } 
				];
let FourOnFour = [ 
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" }, 
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" }, 
					{ "class": "div-1", "size": "1up" }
				];
let KitchenSink = [ 
					{ "class": "div-2", "size": "2up" }, { "class": "div-2", "size": "2up" },  
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" }, 
					{ "class": "div-4", "size": "4up" }, { "class": "div-4", "size": "4up" },  
					{ "class": "div-8", "size": "8up" }, { "class": "div-8", "size": "8up" }, 
					{ "class": "div-8", "size": "8up" }, { "class": "div-8", "size": "8up" }, 
					{ "class": "div-8", "size": "8up" }, { "class": "div-8", "size": "8up" }, 
					{ "class": "div-8", "size": "8up" }, { "class": "div-8", "size": "8up" }, 
				];
let XbeX = [  
					{ "class": "div-8", "size": "8up" }, { "class": "div-8-top08", "size": "8up" }, 
					{ "class": "div-8-mid1-02", "size": "8up" }, { "class": "div-8-mid1-07", "size": "8up" },  
					{ "class": "div-8-mid2-03", "size": "8up" }, { "class": "div-8-mid2-06", "size": "8up" }, 
					{ "class": "center-half-vid", "size": "2up" }, { "class": "div-8-mid6-02", "size": "8up" },
					{ "class": "div-8-mid6-06", "size": "8up" }, { "class": "div-8-bottom01", "size": "8up" },  
					{ "class": "div-8-bottom08", "size": "8up" }, { "class": "div-1", "size": "1up" }
				];

let XbeXFloat = [  
					{ "class": "div-8", "size": "8up" }, { "class": "div-8-top08", "size": "8up" }, 
					{ "class": "div-8-mid1-02", "size": "8up" }, { "class": "div-8-mid1-07", "size": "8up" },  
					{ "class": "div-8-mid2-03", "size": "8up" }, { "class": "div-8-mid2-06", "size": "8up" }, 
					{ "class": "center-half-vid", "size": "2up" }, { "class": "div-8-mid6-02", "size": "8up" },
					{ "class": "div-8-mid6-06", "size": "8up" }, { "class": "div-8-bottom01", "size": "8up" },  
					{ "class": "div-8-bottom08", "size": "8up" }
				];

let VerticalLine = [ 
					{ "class": "center-8-top1", "size": "8up" }, { "class": "center-8-top2", "size": "8up" }, 
					{ "class": "center-half-vid", "size": "2up" }, 
					{ "class": "center-8-top6", "size": "8up" }, { "class": "center-8-top8", "size": "8up" }, 
					{ "class": "div-1", "size": "1up" }
				];

let VerticalLineFloat = [ 
					{ "class": "center-8-top1", "size": "8up" }, { "class": "center-8-top2", "size": "8up" }, 
					{ "class": "center-half-vid", "size": "2up" }, 
					{ "class": "center-8-top6", "size": "8up" }, { "class": "center-8-top8", "size": "8up" }
				];

let HorizontalLineFloat = [ 
					{ "class": "center-8-left1", "size": "8up" }, { "class": "center-8-left2", "size": "8up" }, 
					{ "class": "center-half-vid", "size": "2up" }, 
					{ "class": "center-8-left6", "size": "8up" }, { "class": "center-8-left7", "size": "8up" }
				];

let HorizontalLine = [ 
					{ "class": "center-8-left1", "size": "8up" }, { "class": "center-8-left2", "size": "8up" }, 
					{ "class": "center-half-vid", "size": "2up" }, 
					{ "class": "center-8-left6", "size": "8up" }, { "class": "center-8-left7", "size": "8up" }, 
					{ "class": "div-1", "size": "1up" }
				];

let videoDivsBySize = 
					{ "_1up" : '<video width="3072" height="2732"   loop  muted >\n',
					 "_2up" : '<video width="1536" height="1366"   loop  muted >\n',
					 "_4up" : '<video width="768" height="684"   loop  muted >\n',
					 "_8up" : '<video width="384" height="342"   loop  muted >\n'};

/*let videoDivsBySize = 
					{ "_1up" : '<video width="3072" height="2732"  autoplay loop  muted >\n',
					 "_2up" : '<video width="1536" height="1366"  autoplay loop  muted >\n',
					 "_4up" : '<video width="768" height="684"  autoplay loop  muted >\n',
					 "_8up" : '<video width="384" height="342"  autoplay loop  muted >\n'};
*/					

let layouts = [ OneOnFourUp, TwoOnFourUp, FourUp, EightUp, 
				EightDown, FourOnFour, // KitchenSink, 
				XbeX, VerticalLine,  HorizontalLine, 
				XbeXFloat, VerticalLineFloat,  HorizontalLineFloat ];
let queuedVideos = [];
let videosToQueue = 0;
let readyToDisplay = false;
let datum = "";

function generateTopBottomLayouts() {
	var topBottomLayouts = [];
	for (var top=0; top < 8; top++) { 
		var topLayout = [];
		for (var topPosition=0; topPosition<=top; topPosition++ ) {
			topLayout.push ({ "class": "div-8", "size": "8up" });
		}
		for (var bottomStartPosition=0; bottomStartPosition < 8; bottomStartPosition++) {
			for (var bottomWidth=1; bottomWidth<(9-bottomStartPosition); bottomWidth++){
			var bottomLayout = [];
				for (var bottomPosition=bottomStartPosition; bottomPosition < 8; bottomPosition++) {
					bottomLayout.push({ "class": ("div-8-bottom0" + (bottomPosition+1)), "size": "8up"});
				}
			topBottomLayouts.push(topLayout.concat(bottomLayout, { "class": "div-1", "size": "1up" }));
			}
		}

	}
	return topBottomLayouts;
}
layouts = layouts.concat(generateTopBottomLayouts());

function generateSparseTopLayouts(count) {
	var sparseTopLayouts = [];
	for (var i=0; i<count; i++) {
		var topVideosCount = Math.floor(Math.random() * 6) + 1; //pick between 1 and 6 videos
		var topLayout = [];
		var topLocations = ["div-8-top01", "div-8-mid1-01", "div-8-mid2-01",
				"div-8-top02", "div-8-mid1-02", "div-8-mid2-02",
				"div-8-top03", "div-8-mid1-03", "div-8-mid2-03",
				"div-8-top04", "div-8-mid1-04", "div-8-mid2-04",
				"div-8-top05", "div-8-mid1-05", "div-8-mid2-05",
				"div-8-top06", "div-8-mid1-06", "div-8-mid2-06",
				"div-8-top07", "div-8-mid1-07", "div-8-mid2-07",
				"div-8-top08", "div-8-mid1-08", "div-8-mid2-08"
				];
		for (var top=0; top < topVideosCount; top++) { 
			var itemToRemove = Math.floor(Math.random() * topLocations.length );
			var itemClass = topLocations.splice(itemToRemove,1)[0];
			topLayout.push ({ "class": itemClass, "size": "8up" });
		}
		var bottomLayout = [];
		for (var bottomPosition=0; bottomPosition < 8; bottomPosition++) {
			bottomLayout.push({ "class": ("div-8-bottom0" + (bottomPosition+1)), "size": "8up"});
		}
		sparseTopLayouts.push(topLayout.concat(bottomLayout, { "class": "div-1", "size": "1up" }));
		
	}
	return sparseTopLayouts;
}
layouts = layouts.concat(generateSparseTopLayouts(100));

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

let nextLine = parseInt(getParameterByName('start'));
let sortedByVerbs = {}
let usedByVerbs = {}

function sortVideoFilesByVerbs(videofiles) {
	for (let i=0; i < videofiles.length; i++) {
		let currentVideo = videofiles[i];
		let currentVerb = currentVideo['verb']
		if (! (currentVerb in sortedByVerbs)) {
			sortedByVerbs[currentVerb] = [currentVideo];
		} else {
			sortedByVerbs[currentVerb].push(currentVideo);
		}
	}
	console.log(sortedByVerbs);
}

function chooseLayout() {
	return layouts[Math.floor(Math.random()*layouts.length)];
}

function chooseLine() {
	if (nextLine) {
		var retVal = database[nextLine];
		nextLine += 1;
		if (nextLine == database.length) {
			nextLine = 0;
		}
		return retVal;
	}
	return database[Math.floor(Math.random()*database.length)];
}

function chooseVideos(count, verb) {
	let videoList = [];
	for (let i=0; i < count; i++) {
		if ( verb == undefined) {
			let candidate_video = videofiles[Math.floor(Math.random()*videofiles.length)];
			videoList.push(candidate_video['filename']);

		}
		else {
			if (sortedByVerbs[verb].length < count) {
				sortedByVerbs[verb] = sortedByVerbs[verb].concat(usedByVerbs[verb]);
				usedByVerbs[verb] = [];
			}
			for (let j=0; j<count;j++) {
				let candidate_video = sortedByVerbs[verb][Math.floor(Math.random()*videofiles.length)];
				videoList.push(candidate_video['filename']);

			}
		}
		return videoList;
	//}

}

function populateTextDiv(text) { 
	let thisdiv = '<p>' + text + '</p>';
	return thisdiv ; 
}

function populateVideoDivs(videoList, layout) {
	let returndivs = "";
	for (const newdiv in layout) {
		let nextVideo = videofiles[Math.floor(Math.random()*videofiles.length)];
		returndivs += '<div class="delayed-video ' + layout[newdiv]['class'] + '">\n'
		returndivs += videoDivsBySize['_' + layout[newdiv]['size']];
  		returndivs += '<source src="clips/timed_30/' + nextVideo['filename'] + '_' 
  			+ layout[newdiv]['size'] + '.MP4" type="video/mp4">\n</video>\n</div>\n';
	}
	return returndivs;
}

function enqueueVideo() {
	//alert("ready to play " + queuedVideos[0]);
	queuedVideos.push(true);
	if (queuedVideos.length == videosToQueue) {
		enableNewPage();
	}
}

function fadeText() {
	let textdiv = document.getElementById('quote-text');
	textdiv.classList.toggle('m-fadeIn');
	textdiv.classList.toggle('m-fadeOut');
	let tagdiv = document.getElementById('verb-text');
	tagdiv.classList.toggle('m-fadeIn');
	tagdiv.classList.toggle('m-fadeOut');
	setTimeout(runExhibit, 3000);
}

function enableNewPage() {
	//return "almost implemented"
	let textdiv = document.getElementById('quote-text');
	let tagdiv = document.getElementById('verb-text');
	//textdiv.classList.remove('div-top-fade-in');
	//textdiv.classList.add('div-top-fade-out');
	//tagdiv.classList.remove('div-top-fade-in');
	//tagdiv.classList.add('div-top-fade-out');
	let activeVideoDivs = document.getElementsByClassName("active-video");
	for (var activeVideoDiv = 0;  activeVideoDiv < activeVideoDivs.length; activeVideoDiv++) {
		var activeVideo = activeVideoDivs[activeVideoDiv];
		activeVideo.parentNode.removeChild(activeVideo);
	}
	let delayedVideoDivs = document.getElementsByClassName("delayed-video");
	for (var delayedVideoDiv = 0;  delayedVideoDiv < delayedVideoDivs.length; delayedVideoDiv++) {
		delayedVideoDivs[delayedVideoDiv].classList.add("active-video");
	}
	for (var delayedVideoDiv = 0;  delayedVideoDiv < delayedVideoDivs.length; delayedVideoDiv++) {
		delayedVideoDivs[delayedVideoDiv].classList.remove("delayed-video");
	}
	activeVideoDivs = document.getElementsByClassName("active-video");
	for (var activeVideoDiv = 0;  activeVideoDiv < activeVideoDivs.length; activeVideoDiv++) {
		let newVideoDiv = activeVideoDivs[activeVideoDiv].getElementsByTagName('video')[0];
		newVideoDiv.play();
	}
	//textdiv.classList.add('div-top-fade-in');
	//textdiv.classList.remove('div-top-fade-out');
	textdiv.classList.remove('literature','journalism','socialmedia');
	textdiv.classList.add(datum['Type']);
	textdiv.innerHTML = populateTextDiv(datum['Quote'] );
	textdiv.classList.toggle('m-fadeOut');
	textdiv.classList.toggle('m-fadeIn');
	//tagdiv.classList.add('div-top-fade-in');
	//tagdiv.classList.remove('div-top-fade-out');
	tagdiv.classList.remove('literature-tag','journalism-tag','socialmedia-tag');
	tagdiv.classList.add(datum['Type'] + '-tag');
	tagdiv.innerHTML = '#' + datum['Verb'] ;
	tagdiv.classList.toggle('m-fadeOut');
	tagdiv.classList.toggle('m-fadeIn');
		
}

function runExhibit(database) {
	let layout = chooseLayout();
	datum = chooseLine();
	let videos = chooseVideos(layout.length, datum['Verb']);
	queuedVideos = [];
	videosToQueue = videos.length;
	let videodiv = document.getElementById('video-block');
	videodiv.innerHTML = populateVideoDivs(videos, layout);
	let delayedVideoDivs = document.getElementsByClassName("delayed-video");
	for (var delayedVideoDiv = 0;  delayedVideoDiv < delayedVideoDivs.length; delayedVideoDiv++) {
		let newVideoDiv = delayedVideoDivs[delayedVideoDiv].getElementsByTagName('video')[0];
		newVideoDiv.oncanplaythrough = enqueueVideo ; 
		let foo = 0;
	}
	setTimeout(fadeText, 30000);
}


