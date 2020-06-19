const initAlgolia = () =>{
  const input = document.querySelector('.algolia-input')
  if (input) {
    var places = require('places.js');
    var placesAutocomplete = places({
      appId: 'plFMXJO986S7',
      apiKey: '720485acf1fc5bacae6fff29352929de',
      container: document.querySelector('.algolia-input')
    });
  }
}
export {initAlgolia}
