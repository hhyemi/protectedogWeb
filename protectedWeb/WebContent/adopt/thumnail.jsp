<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.getadopt {
  position: relative;
 max-height: 250px; 
			min-height: 250px; 
			min-width: 255px;
			max-width: 255px;
}

.image {
  display: block;
  max-height: 250px; 
			min-height: 250px; 
			min-width: 255px;
			max-width: 255px;
  height: auto;
}

.overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: white;
  overflow: hidden;
  opacity: 0.7;

			min-width: 255px;
			max-width: 255px;
  height: 80px;
  transition: 1s ease;
}

.getadopt:hover .overlay {
  height: 0%;
}

.text {
  color: #3E6B79;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}
</style>
</head>
<body>

<h2>Slide in Overlay from the Bottom</h2>
<p>Hover over the image to see the effect.</p>

<div class="getadopt">
  <img src="http://placehold.it/400x400" alt="Avatar" class="image">
  <div class="overlay">
    <div class="text">Hello World</div>
  </div>
</div>

</body>
</html>
