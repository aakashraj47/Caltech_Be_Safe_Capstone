<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content=
		"width=device-width, initial-scale=1.0">
	<title>Caltech Project Final</title>
	<style>
		* {
			padding: 0;
			margin: 0;
			font-family: sans-serif;
		}

		body {
			background: yellowgreen;
		}

		.container {
			text-align: center;
			position: absolute;
			top: 20%;
			left: 50%;
			transform: translate(-50%, -50%);
			width: 100%;
		}

		.container span {
			display: block;
		}

		.text1 {
			color: white;
			font-size: 70px;
			font-weight: 700;
			letter-spacing: 8px;
			margin-bottom: 20px;
			background: yellowgreen;
			position: relative;
			animation: text 3s 1;
		}

		.text2 {
			font-size: 30px;
			color: Darkred;
			font-family: Georgia, serif;
		}

		@keyframes text {
			0% {
				color: black;
				margin-bottom: -40px;
			}

			30% {
				letter-spacing: 25px;
				margin-bottom: -40px;
			}

			85% {
				letter-spacing: 8px;
				margin-bottom: -40px;
			}
		}
        
        .animate-charcter
	{
   		text-transform: uppercase;
  	   background-image: linear-gradient(
    		-225deg,
    		#231557 0%,
    		#44107a 29%,
    		#ff1361 67%,
    		#fff800 100%
  		);
  	   background-size: auto auto;
       background-clip: border-box;
       background-size: 200% auto;
       color: #fff;
       background-clip: text;
       text-fill-color: transparent;
       -webkit-background-clip: text;
       -webkit-text-fill-color: transparent;
       animation: textclip 2s linear infinite;
       display: inline-block;
         font-size: 30px;
    }

	@keyframes textclip {
       to {
         background-position: 200% center;
       }
    }
	</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<span class="text1">Hello CalTech!</span>
			<span class="animate-charcter">Welcome to a project deployed by Aakash Raj</span>
            <p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
	

        
		</div>
       <h2>Thank You</h2>
	</div>
 
</body>

</html>
	
