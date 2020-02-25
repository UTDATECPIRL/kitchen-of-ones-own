import { readCSVfile }  from './csvreader.js'

let database = {};
let videofiles = {};

fetch('videofiles.txt')
	.then((response) => {
    	//response => response.clone.text();
		//console.log(response);
		return response.text();
	})
	.then((mydata) => {
		console.log("raw videofiles: " + mydata);
		videofiles = readCSVfile(mydata);
		console.log("videofiles: " + videofiles);

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
/*
let videoDivsBySize = 
					{ "_1up" : '<video width="3072" height="2732"  oncanplay="enqueueVideo()" loop  muted >\n',
					 "_2up" : '<video width="1536" height="1366"  oncanplay="enqueueVideo()" loop  muted >\n',
					 "_4up" : '<video width="768" height="684"  oncanplay="enqueueVideo()" loop  muted >\n',
					 "_8up" : '<video width="384" height="342"  oncanplay="enqueueVideo()" loop  muted >\n'};
*/
let videoDivsBySize = 
					{ "_1up" : '<video width="3072" height="2732"  autoplay loop  muted >\n',
					 "_2up" : '<video width="1536" height="1366"  autoplay loop  muted >\n',
					 "_4up" : '<video width="768" height="684"  autoplay loop  muted >\n',
					 "_8up" : '<video width="384" height="342"  autoplay loop  muted >\n'};
					

let layouts = [ OneOnFourUp, TwoOnFourUp, FourUp, EightUp, EightDown, FourOnFour, KitchenSink ];

function chooseLayout() {
	return layouts[Math.floor(Math.random()*layouts.length)];
}

function chooseLine() {
	console.log("database " + database.length);
	return database[Math.floor(Math.random()*database.length)];
}

function chooseVideos(count, verb) {
	let videoList = [];
	for (let i=0; i < count; i++) {
		let candidate_video = videofiles[Math.floor(Math.random()*videofiles.length)];
		videoList.push(candidate_video['filename']);

	  }
	  return videoList;
	}
function populateTextDiv(text) { 
	let thisdiv = '<p>' + text + '</p>';
	return thisdiv ; 
}
function populateVideoDivs(videoList, layout) {
	let returndivs = "";
	for (const newdiv in layout) {
		let nextVideo = videofiles[Math.floor(Math.random()*videofiles.length)];
		returndivs += '<div class="' + layout[newdiv]['class'] + '">\n'
		returndivs += videoDivsBySize['_' + layout[newdiv]['size']];
  		returndivs += '<source src="clips/timed_30/' + nextVideo['filename'] + '_' 
  			+ layout[newdiv]['size'] + '.MP4" type="video/mp4">\n</video>\n</div>\n';
	

	}
	return returndivs;

}

export function enqueueVideo() {
	alert("ready to play");
}

function enableNewPage() {
	return "not yet implemented"
}

function runExhibit(database) {
	let layout = chooseLayout();
	let datum = chooseLine();
	let textdiv = document.getElementById('quote-text');
	let videos = chooseVideos(layout.length, datum['Verb']);
	console.log("text = " + textdiv);
	textdiv.classList.remove('literature','journalism','social-media');
	textdiv.classList.add(datum['Type']);
	textdiv.innerHTML = populateTextDiv(datum['Quote'] );
	let videodiv = document.getElementById('video-block');
	videodiv.innerHTML = populateVideoDivs(videos, layout);
	console.log("going live = " + enableNewPage()); 
	setTimeout(runExhibit, 30000);
}


