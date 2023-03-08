console.log("Hello from the console!");

// Your code here
fetch('https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b')
  .then((response) => {
    if (response.ok) {
      return response.json();
    } else {
      throw new Error(response);
    }
  })
  .then((data) => {
    console.log("Success!");
    console.log(data);
  },
  (error) => {
    console.log("Failure!");
    console.error(error);
  })

console.log("The AJAX request has been dispatched.")

/* 
When does the request get sent?
  In the fetch request (line 4)

When does the response come back?
  asynchronously through a promise in the first then statement (line 5)

What's the current weather in London?
  light snow

Did the page refresh?
  no

How could you use a different HTTP method in your request?
  by adding an object as the 2nd parameter in the fetch request, that includes:
  header, body, headers, etc.

  ex: fetch('url', {
    method: 'POST',
    body: ...
    headers: {...}
  })
*/