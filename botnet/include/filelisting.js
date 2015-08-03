(function () {
	// https://hacks.mozilla.org/2009/12/uploading-files-with-xmlhttprequest/
	// https://developer.mozilla.org/en-US/docs/Web/API/FormData
	// http://wabism.com/html5-file-api-how-to-upload-files-dynamically-using-ajax/
	var defaults = {
			drop_style: "background: gray;",
			dropzone: "document"
		},
		opts = defaults;

	var sheet = (function() {
		// http://davidwalsh.name/add-rules-stylesheets
		// Create the <style> tag
		var style = document.createElement("style");
		// Add a media (and/or media query) here if you'd like!
		// style.setAttribute("media", "screen")
		// style.setAttribute("media", "only screen and (max-width : 1024px)")
		// WebKit hack :(
		style.appendChild(document.createTextNode(""));
		// Add the <style> element to the page
		document.head.appendChild(style);
		return style.sheet;
	})();
	sheet.insertRule(".dd_drop { " + opts.drop_style + " }", 0);
	function dragelt (elt) {
		while (elt.nodeType == 3 && elt.parentNode) {
			elt = elt.parentNode;
		}
		return elt;
	}
	var dropzone = (opts.dropzone == "document") ? document : document.querySelector(opts.dropzone);
	dropzone.addEventListener("dragover", function (event) {
	  event.preventDefault();
	}, true);
	dropzone.addEventListener("drop", function (event) {
	  var elt = dragelt(event.target),
	  	files = event.dataTransfer.files;

	  event.preventDefault();
	  elt.classList.remove("dd_drop");

	  var total_files = files.length,
	  	total_bytes = 0,
	  	uploaded_bytes = 0,
	  	uploaded_files = 0;

	  for (var i=0; i<total_files; i++) {
		total_bytes += files[i].size;
	  }

	  // figure out path to place files
	  var path = window.location.pathname;
	  // 1. if possible, adjust element to be the link inside a table cell
	  if (elt.nodeName == "TD" && elt.querySelector("a")) {
	  	elt = elt.querySelector("a");
	  }
	  // 2. Extend path with a link when it's href ends with "/"
	  if (elt.nodeName == "A" && elt.getAttribute("href").match(/\/$/) != null) {
	  	path += elt.getAttribute("href");
	  }

	  // ask for confirmation (maybe)
	  // var do_it = confirm("Upload "+files.length+" file"+((files.length > 1)?"s":"")+" to "+path);
	  // alert("You've just dropped " + files.length + " files");
	  // console.log(do_it);
	    var do_it = true;

	  function upload () {  	
		  var formData = new FormData();
		  formData.append("path", path);
		  formData.append("thefile", files[uploaded_files]);
		  // console.log(files);
		  var xhr = new XMLHttpRequest();
		  xhr.open("POST", '/cgi-bin/upload.cgi');
		  xhr.upload.addEventListener("progress", function(e) {
	  		if (e.lengthComputable) {
	  			var adjusted_bytes = (e.loaded / e.total) * files[uploaded_files].size;
	  			// console.log(e.loaded, "loaded", e.total, "total");
	    		// var percentage = Math.round((e.loaded * 100) / e.total);
	    		var percentage = (uploaded_bytes + adjusted_bytes) / total_bytes;
	    		// feedback
	    		console.log((uploaded_files+1)+"/"+total_files+", progress", percentage);
	    	}
		  }, false);
		  xhr.onreadystatechange = function () {
		  	if (this.readyState == this.DONE && this.status == 200) {
		  		// console.log("done", this.status);
		  		uploaded_files += 1;
		  		if (uploaded_files < total_files) {
		  			upload();
		  		} else {
		  		    // all done
		  		    console.log("all done");
				    window.location.reload(true);
		  		}
		  	}
		  };
		  xhr.send(formData);
	  }
	  if (do_it && total_files > 0) { upload(); }
	}, true);
	dropzone.addEventListener("dragenter", function (event) {
		var elt = dragelt(event.target);
		elt.classList.add("dd_drop");
	});
	dropzone.addEventListener("dragleave", function (event) {
		var elt = dragelt(event.target);
		if (elt && elt.classList) {
			elt.classList.remove("dd_drop");
		}
	});

})();

