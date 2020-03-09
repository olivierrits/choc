import "bootstrap";
// import { dragElement } from '../components/choc-it';

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementsByClassName("input-" + elmnt.class)) {
    // if present, the header is where you move the DIV from:
    document.getElementsByClassName("input-" + elmnt.class).onmousedown = dragMouseDown;
    console.log("inside dragElement if statement");
  } else {
    // otherwise, move the DIV from anywhere inside the DIV:
  console.log("inside dragElement else statement");
  elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    console.log("inside dragMouseDown")
    e = e || window.event;
    e.preventDefault();
    // get the mouse cursor position at startup:
    pos3 = e.clientX;
    pos4 = e.clientY;
    console.log(pos3);
    console.log(pos4);
    document.onmouseup = closeDragElement;
    // call a function whenever the cursor moves:
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    // calculate the new cursor position:
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    // set the element's new position:
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
    console.log(pos3);
    console.log(pos4);
  }

  function closeDragElement() {
    // stop moving when mouse button is released:
    document.onmouseup = null;
    document.onmousemove = null;
  }
};

dragElement(document.getElementsByClassName("avatar-choc-it"));
