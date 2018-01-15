// grab html element
var concertContainer = document.querySelector('.row');
// grab the template
var concertTemplate = document.querySelector('#concert-card');
// modify it's styling

// concertContainer.appendChild(concertTemplate.content.cloneNode(true));

axios.get("http://localhost:3000/v1/concerts").then(function(response) {
  console.log(response.data);
  var concerts = response.data;
  for (var i = 0; i < concerts.length; i++) {
    var concertClone = concertTemplate.content.cloneNode(true);
    concertClone.querySelector('.name').innerText = concerts[i].name;
    concertClone.querySelector('.date').innerText = concerts[i].date;
    concertClone.querySelector('.duration').innerText = concerts[i].duration;
    concertClone.querySelector('.cost').innerText = concerts[i].cost;
    concertContainer.appendChild(concertClone);
  }
});
