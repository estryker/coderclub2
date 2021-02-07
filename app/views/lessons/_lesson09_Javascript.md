
# Javascript

HTML and **Javascript** can work together to create interactive websites. Unlike Ruby, Python, or other languages that run on the server, Javascript runs in the user's browser. Because of this, Javascript can modify the webpage _while the user is interacting with it_ - something you can't accomplish with server-side code. Usually, a web developer assigns "ids", like variable names, to HTML elements to make it easier for the Javascript to find those elements.

```
<p id="blah"></p>
```

Now, the developer can reference this paragraph (```<p>```) element by asking for the element based on the id "blah".

```  
document.getElementById("blah").innerText = "Hello, world!";  
```

## Project

Write a web page that has a text box (input field) for the user to enter their name. When the user clicks the "submit" button, add the text "Hi, [name]" to the page. Add another button the user can click to change the color of the greeting. At first, you might have only one option, but later, try changing the button to suggest each color of the rainbow, in order. If you've done all that and still have more time, add a "Reset" button that resets the page back to the default greeting (both text and color) when the user clicks.

You can use the _alert()_ and _console.log()_ functions to help with debugging!

### References

*   To add a text box to your page, you'll need to know how to add an [input field](https://www.w3schools.com/html/html_form_input_types.asp).
*   Use the [Javascript tutorial](https://www.w3schools.com/js/default.asp) to learn the basics of javascript. Start with the example on the first page to learn how to use a button to update the text in a paragraph using the paragraph's id.
*   Then, look at the [HTML attributes](https://www.w3schools.com/js/tryit.asp?filename=tryjs_intro_lightbulb) example. To change the color of an element, use the element's _style.color_ instead of _src_.
*   When you need to run more than one simple line of code, you might want to use a [function](https://www.w3schools.com/js/tryit.asp?filename=tryjs_whereto_head).

### Help
[Hints](https://www.w3schools.com/code/tryit.asp?filename=FNQ11J84VV9R)
