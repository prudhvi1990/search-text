<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script type="text/javascript">
var parentHtml;
function getRawSourceCode() {
	 var xhttp = new XMLHttpRequest();
	 var b = '<%=request.getRequestURL().toString()%>';
	
		var url = encodeURIComponent(document.getElementById('urlValue').value);
		xhttp.open("GET", b + "rest/hello?inputUrl=" + url, false);
		xhttp.setRequestHeader("Content-type", "application/json");
		xhttp.send();
		var response = xhttp.responseText;
		var responseFilter1 = response.replace(new RegExp('<', 'g'), '&lt;')
		var responseFilter2 = responseFilter1.replace(new RegExp('>', 'g'),
				'&gt;')

		document.getElementById('text').innerHTML = responseFilter2;

		parentHtml = document.getElementById('text').innerHTML;
	}

	window.onclick = function() {

		if (window.getSelection().toString() != ""
				&& window.getSelection().toString() != " ") {
			var selectedString = window.getSelection().toString().trim();

			var newhtml = parentHtml.replace(new RegExp(selectedString, 'g'),
					'<font color="red">' + selectedString + '</font>')
			document.getElementById('text').innerHTML = "";
			document.getElementById('text').innerHTML = newhtml;
		}
	}
	function selectedText() {

	}
</script>
</head>
<body>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-md-offset-3">
					<h1>Please enter the Url to get source Code</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-md-offset-5">
					<input type="Text" id="urlValue" placeholder="Please enter the URL"></input>
					<button class="button" onClick="getRawSourceCode()">Get
						Code</button>
				</div>
			</div>
			<div class="row">
				<div id="text"></div>
			</div>
		</div>
	</section>
</body>
</html>