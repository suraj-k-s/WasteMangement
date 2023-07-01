<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
  <style>
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
      background-color: #fefefe;
      margin: 5% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      height: 400px;
    }

    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }

    #map {
      height: 300px;
    }
  </style>
</head>
<body>
  <button id="openModalBtn">Open Modal</button>

  <div id="myModal" class="modal">
    <div class="modal-content">
      <span class="close">&times;</span>
      <h2>Choose Location</h2>
      <div id="map"></div>
      <button id="currentLocationBtn">Choose Current Location</button>
    </div>
  </div>

  <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
  <script>
    var map;
    var marker;

    // Initialize the map when the modal is opened
    function initializeMap() {
      map = L.map('map').setView([51.505, -0.09], 13);

      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(map);

      // Handle click event on the map to set the marker
      map.on('click', function(e) {
        if (marker) {
          map.removeLayer(marker);
        }
        marker = L.marker(e.latlng).addTo(map);
      });

      // Handle click event on the "Choose Current Location" button
      var currentLocationBtn = document.getElementById("currentLocationBtn");
      currentLocationBtn.addEventListener("click", function() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude;
            var lng = position.coords.longitude;

            if (marker) {
              map.removeLayer(marker);
            }
            marker = L.marker([lat, lng]).addTo(map);

            map.setView([lat, lng], 13);
          });
        } else {
          alert("Geolocation is not supported by your browser.");
        }
      });
    }

    // Get the button and modal elements
    var openModalBtn = document.getElementById("openModalBtn");
    var modal = document.getElementById("myModal");

    // Get the close button element
    var closeBtn = document.getElementsByClassName("close")[0];

    // Open the modal when the button is clicked
    openModalBtn.addEventListener("click", function() {
      modal.style.display = "block";
      initializeMap();
    });

    // Close the modal when the close button is clicked
    closeBtn.addEventListener("click", function() {
      modal.style.display = "none";
    });
  </script>
</body>
</html>
