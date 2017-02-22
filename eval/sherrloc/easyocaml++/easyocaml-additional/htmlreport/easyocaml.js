var codeItemName = 'codeitem';

var standardClass = 'standard';
var errorClass = 'error';
var endpoint1Class = 'endpoint1';
var endpoint2Class = 'endpoint2';
var alertClass = 'alert';
var unboundvarClass = 'unboundvar';
var currentErrorClass = 'currenterror';
var otherErrorClass = 'othererror';

var errorListId = 'errorlist';
var errorId = 'error';
var resetId = 'reset';

var parser=new DOMParser();
var errors = new Array();
var codeItems = new Object();

function setClass(id, clazz) {
  if (id in codeItems)
    codeItems[id].className = clazz;
  else
    alert(id + ' is an undefined code item.');
}

function createTextNodeWithClass(className, text) {
  var span = document.createElement('span');
  span.className = className;
  span.appendChild(document.createTextNode(text));
  return span;
}

function Clash(msg, endpoint1, endpoint2, errorlocs) {
  this.msg = msg;
  this.endpoint1 = endpoint1;
  this.endpoint2 = endpoint2;
  this.errorlocs = errorlocs;
  this.message = function() {
    var s = document.createElement("span");
    s.innerHTML = msg;
    return s;
  }
  this.display = function() {
    for(var i in this.errorlocs)
      setClass(this.errorlocs[i], errorClass)
    setClass(this.endpoint1, endpoint1Class);
    setClass(this.endpoint2, endpoint2Class);
  }
}

function LocalError(desc, loc) {
  this.desc = desc;
  this.loc = loc;
  this.message = function() {
    var span = document.createElement('span');
    span.appendChild(document.createTextNode(this.desc));
    return span;
  }
  this.display = function() {
    setClass(this.loc, unboundvarClass);
  }
}

function init(errs) {
  errors = errs;

  var spans = document.getElementsByName(codeItemName);
  for(var i = 0; i < spans.length; i++) 
    codeItems[spans[i].getAttribute('id')] = spans[i]

  for(var spanId in codeItems)
    codeItems[spanId].className = standardClass;

  var errorlist = document.getElementById(errorListId);
  for(var i in errors) {
    var sp = document.createElement('span');
    sp.setAttribute('onclick', 'javascript:error('+i+')');
    sp.setAttribute('id', errorId + i);
    sp.setAttribute('class', otherErrorClass);
    sp.appendChild(errors[i].message());
    var li = document.createElement('li');
    li.appendChild(sp);
    errorlist.appendChild(li);
  }
  reset();
}

function reset() {
  for(var spanId in codeItems)
    codeItems[spanId].className = standardClass;
  for(var i in errors)
    document.getElementById(errorId + i).className = otherErrorClass;
  document.getElementById(resetId).className = currentErrorClass;
}

function registerErrors(errs) {
  errors = errs;
}

function error(n) {
  reset();
  document.getElementById(resetId).className = otherErrorClass;
  errors[n].display();
  document.getElementById(errorId + n).className = currentErrorClass;
}
