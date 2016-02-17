// start Mixpanel
// (function(e,b){if(!b.__SV){var a,f,i,g;window.mixpanel=b;b._i=[];b.init=function(a,e,d){function f(b,h){var a=h.split(".");2==a.length&&(b=b[a[0]],h=a[1]);b[h]=function(){b.push([h].concat(Array.prototype.slice.call(arguments,0)))}}var c=b;"undefined"!==typeof d?c=b[d]=[]:d="mixpanel";c.people=c.people||[];c.toString=function(b){var a="mixpanel";"mixpanel"!==d&&(a+="."+d);b||(a+=" (stub)");return a};c.people.toString=function(){return c.toString(1)+".people (stub)"};i="disable time_event track track_pageview track_links track_forms register register_once alias unregister identify name_tag set_config people.set people.set_once people.increment people.append people.union people.track_charge people.clear_charges people.delete_user".split(" ");
// for(g=0;g<i.length;g++)f(c,i[g]);b._i.push([a,e,d])};b.__SV=1.2;a=e.createElement("script");a.type="text/javascript";a.async=!0;a.src="undefined"!==typeof MIXPANEL_CUSTOM_LIB_URL?MIXPANEL_CUSTOM_LIB_URL:"file:"===e.location.protocol&&"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js".match(/^\/\//)?"https://cdn.mxpnl.com/libs/mixpanel-2-latest.min.js":"//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js";f=e.getElementsByTagName("script")[0];f.parentNode.insertBefore(a,f)}})(document,window.mixpanel||[]);
// mixpanel.init("fdb0d3d364100623a32292ece89884e2");
// end Mixpanel

var nodes = undefined;
var edges = undefined;
var steps = undefined;
var network = undefined;
var stack = [];
var errors = [];

var sf_target = undefined;
var sb_target = undefined;
var jf_target = undefined;
var jb_target = undefined;
var zm_target = undefined;
var so_target = undefined;

var single_width = 2;
var multi_width = 2;

var func_input = undefined;
var check_btn = undefined;
var submit_btn = undefined;
var editor = undefined;
var mark = undefined;
var safe_banner = undefined;
var unsafe_banner = undefined;

var uuid = undefined;

var snippetnum = 0;

var group = undefined;
var startTime = undefined;
var fixEditor = undefined;

function computeBBox(el) {
    var box = document.getElementById("width-calc");
    box.innerHTML = '<pre><code>' + el + '</code></pre>';
    return { width: box.offsetWidth * 1.05, height: box.offsetHeight };
}

function makeSVG(el) {
    console.log(el);
    var box = computeBBox(el);
    var data =
        '<svg xmlns="http://www.w3.org/2000/svg" width="'+box.width+'" height="'+box.height+'">' +
        '<rect x="0" y="0" width="100%" height="100%" fill="#000000" stroke-width="20" stroke="#ffffff" ></rect>' +
        '<foreignObject x="15" y="10" width="100%" height="100%">' +
        '<div xmlns="http://www.w3.org/1999/xhtml" >' +
        '<pre><code>' +
        el +
        '</code></pre>' +
        '</div>' +
        '</foreignObject>' +
        '</svg>';

    var DOMURL = window.URL || window.webkitURL || window;

    var img = new Image();
    var svg = new Blob([data], {type: 'image/svg+xml;charset=utf-8'});
    var url = DOMURL.createObjectURL(svg);

    return url;
}

function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

var demos = {
  factorial: [ "let rec fac n ="
             , "  if n <= 0 then"
             , "    true"
             , "  else"
             , "    n * fac (n - 1)"
             , ""
             , "let _ = fac 2"
             ].join('\n'),

  wwhile: [ "let (x,y) = (\"5\", 5);;"
          , "let rec wwhile (f,b) ="
          , "  let f b = (x, y) in "
          , "  if y = true "
          , "  then wwhile (f, x)"
          , "  else x;;"
          ].join('\n'),

  loop: [ "let f lst ="
        , "  let rec loop lst acc ="
        , "    if lst = [] then"
        , "      acc"
        , "    else"
        , "      ()"
        , "  in"
        , "  match loop lst [(0.0,0.0)] with"
        , "    | h :: t -> h;;"
        ].join('\n'),

  palindrome: [ "let listReverse l ="
              , "  let rec helper xs = function "
              , "    | [] -> xs "
              , "    | hd::tl -> helper (hd :: xs) tl "
              , "  in helper [];;"
              , ""
              , "let palindrome (w : char list) ="
              , "  if (listReverse w) = w "
              , "  then true "
              , "  else false;;"
              ].join('\n'),

};

function loadDemo(demo) {
  editor.setValue(demos[demo]);
}

function resetButtons() {
  sf_target = undefined;
  sb_target = undefined;
  jf_target = undefined;
  jb_target = undefined;
  zm_target = undefined;
  so_target = undefined;

  // document.getElementById('step-forward').disabled = true;
  // document.getElementById('step-backward').disabled = true;
  // document.getElementById('jump-forward').disabled = true;
  // document.getElementById('jump-backward').disabled = true;
  // document.getElementById('step-into').disabled = true;
  // document.getElementById('step-over').disabled = true;
}

function isSingleStep(from, to) {
  return allEdges.get({filter: function(x) {
      return x.from === from && x.to === to &&
             x.label.indexOf('StepsTo') >= 0;
    }}).length > 0;
}

function findPath(from, to) {
  var next = from;
  var edges = [];
  while (true) {
    var outEdges = allEdges.get({filter: function(x) {
      return x.from === next &&
             x.label.indexOf('StepsTo') >= 0;
    }});
    if (outEdges.length === 0) return [];
    var out = outEdges[0];
    edges.push(out)
    if (out.to === to) return edges;
    next = out.to;
  }
  return [];
}

function pathNodes(path) {
  return [path[0].from].concat(path.map(getEdgeTo));
}

function getEdgeFrom(edge) { return edge.from; }
function getEdgeTo(edge) { return edge.to; }

function getSubTerms(nodeId) {
  return allEdges.get({filter: function(x) {
    return x.from === nodeId && x.label.indexOf('SubTerm') >= 0;
  }}).map(getEdgeTo);
}

function getParents(nodeId) {
  return allEdges.get({filter: function(x) {
    return x.to === nodeId && x.label.indexOf('SubTerm') >= 0;
  }}).map(getEdgeFrom);
}

function getNextTerm(nodeId) {
  return allEdges.get({filter: function(x) {
    return x.from === nodeId && x.label.indexOf('StepsTo') >= 0;
  }}).map(getEdgeTo)[0];
}

// transitive closure of `getNextTerm`
function crunch(nodeId) {
  var next = getNextTerm(nodeId);
  if (next) {
    return crunch(next);
  } else {
    return nodeId;
  }
}

// return the `id` of the immediate subterm of `from` the will be
// stepped next.
function findNextStep(from, to) {
  var path = findPath(from, to);
  var subs = getSubTerms(from);
  var candidates = subs.map(getNextTerm)
  candidates = candidates.map(getParents);
  var next = candidates.findIndex(function(c) { return c.includes(path[0].to); });
  return subs[next];
}

function clearMark() {
  if (mark)
    mark.clear();
  mark = undefined;
}

function canStepUndo() {
  // console.log('canStepUndo');
  if (stack.length > 0) {
    // document.getElementById('undo').disabled = false;
  } else {
    // document.getElementById('undo').disabled = true;
  }
}

function stepUndo() {
  // mixpanel.track("Undo", { "uuid": uuid });
  // var tmp = stack.pop();
  // tmp = stack.pop()
  // console.log(tmp);
  // stack.push(tmp);
  var diff = stack.pop()
  // network.setData(stack[stack.length-1]);
  network.body.data.nodes.remove(diff.nodes.add);
  network.body.data.nodes.add(diff.nodes.remove);
  network.body.data.edges.remove(diff.edges.add);
  network.body.data.edges.add(diff.edges.remove);
  canStepUndo();
}

function canStepForward(node) {
  // ctxmenu.style.visibility = 'hidden';
  // console.log('stepForward');
  var out = allEdges.get({filter: function(x) {
    return x.from === node.id && x.label.indexOf('StepsTo') >= 0;
  }});
  var curEdge = network.body.data.edges.get({filter: function(x) {
    return x.from === node.id;
  }});
  if (out.length === 0 || curEdge.length === 0 || network.body.data.nodes.get(out[0].to) !== null) return;
  // console.log(network.body.data.nodes.get(out[0]));
  out = out[0];
  curEdge = curEdge[0];
  // console.log(out);
  sf_target = [out.to, curEdge];
  // document.getElementById('step-forward').disabled = false;
  // insertNode(allNodes.get(next.from), edge);
}

function stepForward() {
  // mixpanel.track("StepForward", { "node": sf_target[0], "replacingEdge": sf_target[1], "uuid": uuid });
  insertNode(allNodes.get(sf_target[0]), sf_target[1]);
  resetButtons();
}

function canStepBackward(node) {
  // ctxmenu.style.visibility = 'hidden';
  // console.log('stepBackward');

  var curEdges = network.body.data.edges.get({filter: function(x) {
    return x.to === node.id;
  }});
  if (curEdges.length === 0) return;
  var curEdge = curEdges[0];
  var path = findPath(curEdge.from, curEdge.to);
  // console.log(curEdge, path);
  if (path.length <= 2) return;

  sb_target = [path[path.length - 1].from, curEdge];
  // document.getElementById('step-backward').disabled = false;
}

function stepBackward() {
  // mixpanel.track("StepBackward", { "node": sb_target[0], "replacingEdge": sb_target[1], "uuid": uuid});
  insertNode(allNodes.get(sb_target[0]), sb_target[1]);
  resetButtons();
}

function canJumpForward(node) {
  var curEdges = network.body.data.edges.get({filter: function(x) {
    return x.from === node.id;
  }});
  if (curEdges.length === 0) return;
  var curEdge = curEdges[0];
  var path = findPath(curEdge.from, curEdge.to);
  // console.log(curEdge, path);
  if (path.length <= 1) return;
  if (path[0].label.indexOf('ReturnStep') >= 0) {
    jf_target = [path[0].to, curEdge];
    // document.getElementById('jump-forward').disabled = false;
    return;
  }
  for (var i = 1; i < path.length; i++) {
    var e = path[i];
    if (network.body.data.nodes.get(e.to) !== null) {
      return;
    }
    if (e.label.indexOf('CallStep') >= 0) {
      jf_target = [e.from, curEdge];
      // document.getElementById('jump-forward').disabled = false;
      return;
    }
    if (e.label.indexOf('ReturnStep') >= 0) {
      jf_target = [e.to, curEdge];
      // document.getElementById('jump-forward').disabled = false;
      return;
    }
  }
}

function jumpForward() {
  // mixpanel.track("JumpForward", { "node": jf_target[0], "replacingEdge": jf_target[1], "uuid": uuid});
  insertNode(allNodes.get(jf_target[0]), jf_target[1]);
  resetButtons();
}

function canJumpBackward(node) {
  var curEdges = network.body.data.edges.get({filter: function(x) {
    return x.to === node.id;
  }});
  if (curEdges.length === 0) return;
  var curEdge = curEdges[0];
  var path = findPath(curEdge.from, curEdge.to);
  console.log(curEdge, path);
  if (path.length === 0) return;
  for (var i = path.length-1; i >= 0; i--) {
    var e = path[i];
    if (network.body.data.nodes.get(e.from) !== null) {
      return;
    }
    if (e.label.indexOf('CallStep') >= 0) {
      jb_target = [e.from, curEdge];
      // document.getElementById('jump-backward').disabled = false;
      return;
    }
  }
}

function jumpBackward() {
  // mixpanel.track("JumpBackward", { "node": jb_target[0], "replacingEdge": jb_target[1], "uuid": uuid});
  insertNode(allNodes.get(jb_target[0]), jb_target[1]);
  resetButtons();
}

function canStepOver(node) {
  var curEdges = network.body.data.edges.get({filter: function(x) {
    return x.from === node.id;
  }});
  if (curEdges.length === 0) return;
  var curEdge = curEdges[0];
  var path = pathNodes(findPath(curEdge.from, curEdge.to));
  var subId = findNextStep(curEdge.from, curEdge.to);
  var nextIds = getParents(crunch(subId));
  // NOTE: we traverse `path` instead of `nextIds` to ensure we find the
  // first valid node.
  var nextId = path[path.findIndex(function(n) { return nextIds.includes(n); })];
   // nextIds[nextIds.findIndex(function(n) { return path.includes(n); })];
  if (nextId && !network.body.data.nodes.get(nextId)) {
    so_target = [nextId, curEdge];
    // document.getElementById('step-over').disabled = false;
  }
}

function stepOver() {
  // mixpanel.track("StepOver", { "node": so_target[0], "replacingEdge": so_target[1], "uuid": uuid});
  insertNode(allNodes.get(so_target[0]), so_target[1]);
  resetButtons();
}

function canStepInto(node) {
  // console.log('canStepInto');
  var subs = allEdges.get({filter: function(x) {

    if (!(x.from === node.id && x.label.indexOf('SubTerm') >= 0))
      return false;

    var steps = allEdges.get({filter: function(y) {
        return y.from === x.to && y.label.indexOf('StepsTo CallStep') >= 0; }
    });
    // console.log(x, steps);

    return steps.length > 0;
  }});
  // console.log(subs);
  if (subs.length === 0) return;
  // TODO: handle case where multiple subterms are at a function call
  var sub = allNodes.get(subs[0].to);
  var val = sub;
  var valId = val.id;
  // console.log(sub);
  while (true) {
    var outEdges = allEdges.get({filter: function(x) {
      return x.from === valId &&
             x.label.indexOf('StepsTo') >= 0;
    }});
    // console.log(outEdges);
    if (outEdges.length === 0) break;
    valId = outEdges[0].to;
    // console.log(valId);
  }
  val = allNodes.get(valId);
  if (val.id === sub.id) return;

  zm_target = [sub, val];
  // document.getElementById('step-into').disabled = false;
}

function stepInto() {
  // mixpanel.track("StepInto", { "subTerm": zm_target[0], "subValue": zm_target[1], "uuid": uuid});

  var sub = zm_target[0];
  var val = zm_target[1];

  var pnodes = network.body.data.nodes;
  var pedges = network.body.data.edges;

  if (allEdges.get({filter: function(x) {
        return x.from === sub.id && x.to === val.id;
      }}).length > 0) {
    var width = single_width;
  } else {
    var width = multi_width;
  }

  var nodeIds = pnodes.add([sub, val]);
  var edgeIds = pedges.add([{arrows: 'to', from: sub.id, to: val.id, width: width}]);

  var diff = { nodes: { add: nodeIds, remove: [] },
               edges: { add: edgeIds, remove: [] }
             };

  // console.log(newData);
  stack.push(diff);
  // network.setData(newData);
  network.unselectAll();
  resetButtons();
  clearMark();
  canStepUndo();
}

// Repeatedly expand the trace starting at 'nodeId', to produce a
// jump-compressed trace.
function expandTrace(nodeId) {
    var node = network.body.data.nodes.get(nodeId);
    console.log(node);
    canJumpForward(node);
    if (jf_target !== undefined) {
        nextId = jf_target[0];
        jumpForward();
        expandTrace(nextId);
    }
}

function insertNode(node, replacingEdge) {
  // IMPORTANT: copy the dataset so we can save state between operations
  var pnodes = network.body.data.nodes;
  var pedges = network.body.data.edges;

  if (isSingleStep(replacingEdge.from, node.id)) {
    var width_in = single_width;
  } else {
    var width_in = multi_width;
  }
  if (isSingleStep(node.id, replacingEdge.to)) {
    var width_out = single_width;
  } else {
    var width_out = multi_width;
  }

  var nodeIds = pnodes.add(node);
  var edgeIds = pedges.add([{arrows: 'to', from: replacingEdge.from, to: node.id, width: width_in}
                           ,{arrows: 'to', from: node.id, to: replacingEdge.to, width: width_out}]);
  pedges.remove(replacingEdge);

  var diff = { nodes: { add: nodeIds, remove: [] },
               edges: { add: edgeIds, remove: [replacingEdge] }
             };

  // console.log(newData);
  stack.push(diff);
  // network.setData(newData);
  network.unselectAll();
  clearMark();
  resetButtons();
  canStepUndo();
  // network.stabilize();
  // network.redraw();
}

// function notifySafe() {
//   safe_banner.style.display = 'block';
// }
function notifyUnsafe(reason) {
  unsafe_banner.innerText = reason;
  unsafe_banner.style.display = 'block';
}

function setup() {
  var prog = document.getElementById('prog');
  editor = CodeMirror.fromTextArea(prog, {
    mode: "mllike",
    lineNumbers: true,
    gutters: ["CodeMirror-lint-markers"],
    lint: {
      lintOnChange: false,
      getAnnotations: function(d, o, e) { return errors; },
    },
  });
                                   
  // var fix = document.getElementById('fix');
  // fixEditor = CodeMirror.fromTextArea(fix, {
  //   mode: "mllike",
  //   lineNumbers: true,
  // });

  // TODO: how do i get the hash fragment and base64 decode in javascript??
  // editor.setValue(atob(window.location.hash));

  // func_input = document.getElementById('var-input');
    // submit_btn = document.getElementById('submit-btn');
  // safe_banner = document.getElementById('safe-banner');
  unsafe_banner = document.getElementById('unsafe-banner');

  editor.setValue(demos.factorial);
  draw(factrace);
  expandTrace(factrace.root);

  // Instance the tour
  var tour = new Tour({
    onEnd: function(_) { window.location.href = "http://dijkstra.cs.virginia.edu/projects/nanomaly/survey/survey.html"; },
    steps: [
    {
      element: ".CodeMirror", // ".CodeMirror-line :contains(n - 1)",
      title: "Bad Factorial",
      content: "Here's a simple factorial program with a bug. Notice that line 5 is underlined in red. "
             // + "Mouseover the highlighted line.",
             + "If you mouseover line 5, a popup will explain that the program tried to multiply an int "
             + "and a bool, which is not allowed.",
      placement: "bottom",
      // reflex: true, // "hover",
      //backdrop: true,
    },
    {
      element: "#vis",
      title: "Visualizing The Execution",
      content: "This is a visualization of the execution of <code>fac 2</code>. "
             + "Each node represents a step in the computation. "
             + "You can click-and-drag to move the nodes, and zoom in and out with the scroll wheel. "
             + "When you mouse over any of the nodes, a box will pop up showing what all the variables "
             + "in the expression map to at that point in the program. ",
      placement: "left",
      //backdrop: true,
    },
    {
      element: "#vis",
      title: "Stuck Expressions",
      content: "Notice that the bottom node is red, this means that the program <b>got stuck</b> at that point. "
             + "Furthermore, <code>1 * true</code> is highlighted, which is the expression the program "
             + "was trying to evaluate when it got stuck. The red alert box above the visualization tells us "
             + "why the program got stuck, in this case because we tried to multiply an int with a bool. ",
      placement: "left",
      //backdrop: true,
    },
    {
      element: "#vis",
      title: "Highlighting Source Expressions",
      content: "Click on the node containing <code>fac 0</code> in bold. Notice that <code>fac (n-1)</code> is highlighted in "
             + "the code editor on the left. This is the expression in the source program that corresponds "
             + "to the next expression we will evaluate.",
      placement: "left",
      //backdrop: true,
    },
    // {
    //   element: "#vis",
    //   title: "Local Environments",
    //   content: "Hover over any of the blue nodes. A box will pop up showing what all variables in the "
    //          + "expression map to at that point in the program. In this case we only see the definition "
    //          + "of <code>fac</code>, but in general seeing the local variables can be useful.",
    //   placement: "left",
    //   //backdrop: true,
    // },
    {
      element: "#vis",
      title: "Identifying The Problem",
      content: "The visualization shows an overview on the program execution. "
             + "From <code>fac 2</code> we get to <code>2 * fac 1</code>. "
             + "From <code>fac 1</code> we get to <code>1 * fac 0</code>. "
             + "Finally, <code>fac 0</code> is just <code>true</code>, "
             + "which is the source of our troubles, as <code>fac</code> should "
             + "always return an <code>int</code>. So we can blame the <code>true</code> on "
             + "line 3 of the program, even though the error occurs on line 5.",
      placement: "left",
      //backdrop: true,
    },
    {
      // element: "#vis",
      orphan: true,
      title: "",
      content: "This concludes the tutorial. Click \"End tour\" to start the survey. Good luck!",
      // placement: "left",
      //backdrop: true,
      //redirect: "survey.html",
    },
    ]});

  // Initialize the tour
  tour.init(true);

  // Start the tour
  tour.start(true);

  tour.goTo(0);

  console.log('tour started');
}

function draw(data) {
  // console.log(JSON.stringify(data));
  // ctxmenu = document.getElementById('menu');
    var stuckNode = data.nodes.filter(function(n) {
        return n.id === data.bad;
    })[0];

    notifyUnsafe(data.reason);

    errors = [{ from: { line: stuckNode.span.startLine - 1,
                        ch: stuckNode.span.startCol - 1},
                to: { line: stuckNode.span.endLine - 1,
                      ch: stuckNode.span.endCol},
                message: data.reason,
                severity: 'error'
              }];
    editor.performLint();
  var container = document.getElementById('vis');

  container.style['display'] = '';
  // var dot = data.dot; //document.getElementById('reduction-graph').text;
  var root = data.root; //document.getElementById('root-node').text;
  var stuck = data[data.result]; //document.getElementById('stuck-node').text;
  // data = vis.network.convertDot(dot);
  // data.nodes.forEach(function(n) {
  //   n.label = n.label.replace(/\\n/g, "\n");
  // });
  data.nodes.map(function(node) {
    if (node.env && node.env.length > 0) {
      var wrap = function (s) { return '<pre style="font-size: 10px;">' + s + '</pre>'; };
      var tb = '<h4>Environment</h4>'; // '<table class="table">';
      var env = node.env;
      for (var i = 0; i < env.length; i++) {
        tb += wrap('val ' + env[i][0] + ' = ' + env[i][1]);
        // tb += '<tr><th scope="row">' + wrap(env[i][0]) + '</th><td><small>' + wrap(env[i][1]) + '</small></td></tr>';
      }
      // tb += '</table>';
      node.title = tb;
    }
    if (node.annots.length > 0) {
      // console.log(node);

      var pre   = node.label.substring(0, node.annots[0][0]);
      if (pre.length > 0) {
        pre = pre.split('\n');
      } else {
        pre = [];
      }
      var redex = node.label.substring(node.annots[0][0],
                                       node.annots[0][0] + node.annots[0][1]);
      if (redex[redex.length-1] === '\n') {
        redex = redex.split('\n'); redex.push("");
      } else {
        redex = redex.split('\n');
      }
      var post  = node.label.substring(node.annots[0][0] + node.annots[0][1]);
      if (post.length > 0) {
        post = post.split('\n');
      } else {
        post = [];
      }
      var i = 0;
      var segs = [];
      var contextStyle = 'rgba(0, 0, 0, 0.33)'
      for (var j = 0; j < pre.length; j++) {
        segs[i] = segs[i] || [];
        segs[i].push({text: pre[j], style: contextStyle});
        if (j < pre.length - 1) i++;
      }
      for (var j = 0; j < redex.length; j++) {
        segs[i] = segs[i] || [];
        segs[i].push({text: redex[j]});
        if (j < redex.length - 1) i++;
      }
      for (var j = 0; j < post.length; j++) {
        segs[i] = segs[i] || [];
        segs[i].push({text: post[j], style: contextStyle});
        if (j < post.length - 1) i++;
      }
      node.styleSegments = segs;
      // console.log(node.label,pre,redex,post,node.styleSegments);
    }
      // node.styleSegments = [[{text: 'foo', style: 'red'},{text: 'bar', style: 'blue'}]];
      // var url = makeSVG(node.label);
      // node.image = url;
      // node.shape = 'image';
  });
  allNodes = new vis.DataSet(data.nodes);
  allEdges = new vis.DataSet(data.edges);
  //console.log(allNodes, allEdges, root, stuck);
  var nodes = new vis.DataSet(allNodes.get({filter: function(x) {
    return x.id === root || x.id === stuck;
  }}));
  // color the stuck node red
  if (data.result === "stuck") {
    var stuckNode = nodes.get(stuck);
    var redBG = "#FFD2E5", redBD = "#E92B7C";
    stuckNode.color = { background: redBG, border: redBD,
                        highlight: { background: redBG, border: redBD }
                      };
    nodes.update(stuckNode);
  }
  //console.log(nodes);
  if (allEdges.get({filter: function(x) {
        return x.from === root && x.to === stuck;
      }}).length > 0) {
    var width = single_width;
  } else {
    var width = multi_width;
  }
  var edges = new vis.DataSet([{ arrows: 'to', from: root, to: stuck, width: width}]);
  // steps = new vis.DataSet(data.edges).get({filter: function (x) {
  //   return x.label.indexOf("StepsTo") === 0;
  // }});
  // console.log(steps);
  var options = {
    interaction: {
      selectConnectedEdges: false,
    },
    layout: {
      hierarchical: { direction: 'UD', sortMethod: 'directed', levelSeparation: 100 },
    },
    nodes: {
      font: { face: 'monospace', size: 16 },
      shape: 'box',
    },
    // edges: {
    //   label: "",
    // },
    // physics: { enabled: false},
  };
  var newData = {nodes: nodes, edges: edges};
  // stack.push(newData);
  network = new vis.Network(container, newData, options);
    // network.on("hidePopup", function () {
    //     console.log('hidePopup Event');
    // });
    // network.on("select", function (params) {
    //     console.log('select Event:', params);
    // });
    // network.on("oncontext", function (params) {
    //     console.log('oncontext Event:', params);
    // });
    network.on("selectNode", function (params) {
        // console.log('selectNode Event:', params);
        var node = network.body.data.nodes.get(network.getSelectedNodes()[0]);
        console.log(node);
        if (node.span) {
            mark = editor.markText({line: node.span.startLine - 1, ch: node.span.startCol - 1},
                                   {line: node.span.endLine - 1, ch: node.span.endCol},
                                   {className: "CodeMirror-selected"});
        }
        // if (node.env.length > 0) {
        //   var env = node.env;
        //   $('#vis').popover({title: 'Environment', content: env, placement: 'left', html: true});
        //   $('#vis').popover('show');
        //   // var legend = document.getElementById('legend');
        //   // for (var i = 0; i < env.length; i++) {
        //   //   legend.innerHTML += ('<pre><code>'+ env[i][0] + ' = ' +
        //   //                        env[i][1] + '</code></pre>');
        //   // }
        // }
        // console.log(node);
        canStepForward(node);
        canStepBackward(node);
        canJumpForward(node);
        canJumpBackward(node);
        // canStepInto(node);
        // canStepOver(node);
        // ctxmenu.style.position = 'fixed';
        // ctxmenu.style.top  = params.event.center.x;
        // ctxmenu.style.left = params.event.center.y;
        // ctxmenu.style.visibility = 'visible';
        // ctxmenu.style.zIndex = 1;
    });
    network.on("selectEdge", function (params) {
        return false;
        // console.log('selectEdge Event:', params);
        // canStepForward();
        // canStepBackward();
        // canJumpForward();
        // canJumpBackward();
    });
    network.on("deselectNode", function (params) {
        // console.log('deselectNode Event:', params);
        // document.getElementById('legend').innerHTML = '';
        // $('#vis').popover('destroy');
        resetButtons();
        clearMark();
    });
    // network.on("deselectEdge", function (params) {
    //     console.log('deselectEdge Event:', params);
    //     resetButtons();
    // });
    // network.on("hoverNode", function (params) {
    //     console.log('hoverNode Event:', params);
    // });
    // network.on("hoverEdge", function (params) {
    //     console.log('hoverEdge Event:', params);
    // });
    // network.on("blurNode", function (params) {
    //     console.log('blurNode Event:', params);
    // });
    // network.on("blurEdge", function (params) {
    //     console.log('blurEdge Event:', params);
    // });
}

var factrace = {"root":59,"result":"stuck","reason":"Type error: stuck because `bool' is incompatible with `int'","bad":42,"stuck":9,"edges":[{"arrows":"to","to":1,"from":0,"label":"SubTerm 1"},{"arrows":"to","to":10,"from":0,"label":"StepsTo PrimStep"},{"arrows":"to","to":26,"from":0,"label":"SubTerm 0"},{"arrows":"to","to":27,"from":0,"label":"SubTerm 2"},{"arrows":"to","to":3,"from":2,"label":"SubTerm 1"},{"arrows":"to","to":46,"from":2,"label":"StepsTo BoringStep"},{"arrows":"to","to":51,"from":2,"label":"SubTerm 0"},{"arrows":"to","to":55,"from":3,"label":"SubTerm 1"},{"arrows":"to","to":62,"from":3,"label":"StepsTo BoringStep"},{"arrows":"to","to":63,"from":3,"label":"SubTerm 0"},{"arrows":"to","to":1,"from":4,"label":"SubTerm 1"},{"arrows":"to","to":5,"from":4,"label":"SubTerm 0"},{"arrows":"to","to":12,"from":4,"label":"SubTerm 2"},{"arrows":"to","to":67,"from":4,"label":"StepsTo PrimStep"},{"arrows":"to","to":13,"from":5,"label":"SubTerm 1"},{"arrows":"to","to":54,"from":5,"label":"SubTerm 0"},{"arrows":"to","to":80,"from":5,"label":"StepsTo PrimStep"},{"arrows":"to","to":7,"from":6,"label":"StepsTo BoringStep"},{"arrows":"to","to":20,"from":6,"label":"SubTerm 0"},{"arrows":"to","to":24,"from":6,"label":"SubTerm 1"},{"arrows":"to","to":19,"from":7,"label":"StepsTo PrimStep"},{"arrows":"to","to":20,"from":7,"label":"SubTerm 0"},{"arrows":"to","to":39,"from":7,"label":"SubTerm 1"},{"arrows":"to","to":20,"from":9,"label":"SubTerm 0"},{"arrows":"to","to":42,"from":9,"label":"SubTerm 1"},{"arrows":"to","to":1,"from":10,"label":"SubTerm 1"},{"arrows":"to","to":11,"from":10,"label":"SubTerm 0"},{"arrows":"to","to":27,"from":10,"label":"StepsTo BoringStep"},{"arrows":"to","to":27,"from":10,"label":"SubTerm 2"},{"arrows":"to","to":14,"from":12,"label":"SubTerm 0"},{"arrows":"to","to":69,"from":12,"label":"SubTerm 1"},{"arrows":"to","to":16,"from":15,"label":"StepsTo CallStep"},{"arrows":"to","to":20,"from":15,"label":"SubTerm 0"},{"arrows":"to","to":66,"from":15,"label":"SubTerm 1"},{"arrows":"to","to":20,"from":16,"label":"SubTerm 0"},{"arrows":"to","to":48,"from":16,"label":"StepsTo BoringStep"},{"arrows":"to","to":64,"from":16,"label":"SubTerm 1"},{"arrows":"to","to":0,"from":17,"label":"StepsTo BoringStep"},{"arrows":"to","to":1,"from":17,"label":"SubTerm 1"},{"arrows":"to","to":18,"from":17,"label":"SubTerm 0"},{"arrows":"to","to":27,"from":17,"label":"SubTerm 2"},{"arrows":"to","to":26,"from":18,"label":"StepsTo BoringStep"},{"arrows":"to","to":61,"from":18,"label":"SubTerm 0"},{"arrows":"to","to":82,"from":18,"label":"SubTerm 1"},{"arrows":"to","to":20,"from":19,"label":"SubTerm 0"},{"arrows":"to","to":23,"from":19,"label":"StepsTo CallStep"},{"arrows":"to","to":41,"from":19,"label":"SubTerm 1"},{"arrows":"to","to":22,"from":21,"label":"SubTerm 1"},{"arrows":"to","to":28,"from":21,"label":"SubTerm 2"},{"arrows":"to","to":49,"from":21,"label":"SubTerm 0"},{"arrows":"to","to":56,"from":21,"label":"StepsTo PrimStep"},{"arrows":"to","to":17,"from":23,"label":"SubTerm 1"},{"arrows":"to","to":20,"from":23,"label":"SubTerm 0"},{"arrows":"to","to":35,"from":23,"label":"StepsTo BoringStep"},{"arrows":"to","to":25,"from":24,"label":"SubTerm 1"},{"arrows":"to","to":39,"from":24,"label":"StepsTo BoringStep"},{"arrows":"to","to":40,"from":24,"label":"SubTerm 0"},{"arrows":"to","to":29,"from":25,"label":"StepsTo BoringStep"},{"arrows":"to","to":30,"from":25,"label":"SubTerm 1"},{"arrows":"to","to":73,"from":25,"label":"SubTerm 0"},{"arrows":"to","to":11,"from":26,"label":"StepsTo PrimStep"},{"arrows":"to","to":51,"from":26,"label":"SubTerm 0"},{"arrows":"to","to":82,"from":26,"label":"SubTerm 1"},{"arrows":"to","to":2,"from":27,"label":"StepsTo BoringStep"},{"arrows":"to","to":3,"from":27,"label":"SubTerm 1"},{"arrows":"to","to":77,"from":27,"label":"SubTerm 0"},{"arrows":"to","to":6,"from":28,"label":"StepsTo BoringStep"},{"arrows":"to","to":24,"from":28,"label":"SubTerm 1"},{"arrows":"to","to":74,"from":28,"label":"SubTerm 0"},{"arrows":"to","to":20,"from":29,"label":"SubTerm 0"},{"arrows":"to","to":30,"from":29,"label":"SubTerm 1"},{"arrows":"to","to":78,"from":29,"label":"StepsTo PrimStep"},{"arrows":"to","to":32,"from":31,"label":"StepsTo CallStep"},{"arrows":"to","to":63,"from":31,"label":"SubTerm 0"},{"arrows":"to","to":81,"from":31,"label":"SubTerm 1"},{"arrows":"to","to":1,"from":32,"label":"SubTerm 1"},{"arrows":"to","to":4,"from":32,"label":"StepsTo BoringStep"},{"arrows":"to","to":12,"from":32,"label":"SubTerm 2"},{"arrows":"to","to":36,"from":32,"label":"SubTerm 0"},{"arrows":"to","to":10,"from":33,"label":"SubTerm 1"},{"arrows":"to","to":20,"from":33,"label":"SubTerm 0"},{"arrows":"to","to":34,"from":33,"label":"StepsTo BoringStep"},{"arrows":"to","to":20,"from":34,"label":"SubTerm 0"},{"arrows":"to","to":27,"from":34,"label":"SubTerm 1"},{"arrows":"to","to":76,"from":34,"label":"StepsTo BoringStep"},{"arrows":"to","to":0,"from":35,"label":"SubTerm 1"},{"arrows":"to","to":20,"from":35,"label":"SubTerm 0"},{"arrows":"to","to":33,"from":35,"label":"StepsTo PrimStep"},{"arrows":"to","to":5,"from":36,"label":"StepsTo BoringStep"},{"arrows":"to","to":13,"from":36,"label":"SubTerm 1"},{"arrows":"to","to":53,"from":36,"label":"SubTerm 0"},{"arrows":"to","to":42,"from":37,"label":"StepsTo ReturnStep"},{"arrows":"to","to":51,"from":37,"label":"SubTerm 0"},{"arrows":"to","to":67,"from":37,"label":"SubTerm 1"},{"arrows":"to","to":29,"from":39,"label":"SubTerm 1"},{"arrows":"to","to":40,"from":39,"label":"SubTerm 0"},{"arrows":"to","to":41,"from":39,"label":"StepsTo PrimStep"},{"arrows":"to","to":17,"from":41,"label":"StepsTo CallStep"},{"arrows":"to","to":40,"from":41,"label":"SubTerm 0"},{"arrows":"to","to":78,"from":41,"label":"SubTerm 1"},{"arrows":"to","to":1,"from":42,"label":"SubTerm 1"},{"arrows":"to","to":51,"from":42,"label":"SubTerm 0"},{"arrows":"to","to":21,"from":43,"label":"StepsTo BoringStep"},{"arrows":"to","to":22,"from":43,"label":"SubTerm 1"},{"arrows":"to","to":28,"from":43,"label":"SubTerm 2"},{"arrows":"to","to":44,"from":43,"label":"SubTerm 0"},{"arrows":"to","to":49,"from":44,"label":"StepsTo BoringStep"},{"arrows":"to","to":52,"from":44,"label":"SubTerm 0"},{"arrows":"to","to":68,"from":44,"label":"SubTerm 1"},{"arrows":"to","to":15,"from":45,"label":"StepsTo PrimStep"},{"arrows":"to","to":20,"from":45,"label":"SubTerm 0"},{"arrows":"to","to":46,"from":45,"label":"SubTerm 1"},{"arrows":"to","to":51,"from":46,"label":"SubTerm 0"},{"arrows":"to","to":62,"from":46,"label":"SubTerm 1"},{"arrows":"to","to":66,"from":46,"label":"StepsTo PrimStep"},{"arrows":"to","to":20,"from":48,"label":"SubTerm 0"},{"arrows":"to","to":65,"from":48,"label":"SubTerm 1"},{"arrows":"to","to":79,"from":48,"label":"StepsTo PrimStep"},{"arrows":"to","to":20,"from":49,"label":"SubTerm 0"},{"arrows":"to","to":68,"from":49,"label":"SubTerm 1"},{"arrows":"to","to":84,"from":49,"label":"StepsTo PrimStep"},{"arrows":"to","to":51,"from":50,"label":"StepsTo BoringStep"},{"arrows":"to","to":20,"from":52,"label":"StepsTo BoringStep"},{"arrows":"to","to":54,"from":53,"label":"StepsTo BoringStep"},{"arrows":"to","to":50,"from":55,"label":"SubTerm 0"},{"arrows":"to","to":57,"from":55,"label":"StepsTo BoringStep"},{"arrows":"to","to":58,"from":55,"label":"SubTerm 1"},{"arrows":"to","to":22,"from":56,"label":"SubTerm 1"},{"arrows":"to","to":28,"from":56,"label":"StepsTo BoringStep"},{"arrows":"to","to":28,"from":56,"label":"SubTerm 2"},{"arrows":"to","to":84,"from":56,"label":"SubTerm 0"},{"arrows":"to","to":51,"from":57,"label":"SubTerm 0"},{"arrows":"to","to":58,"from":57,"label":"SubTerm 1"},{"arrows":"to","to":81,"from":57,"label":"StepsTo PrimStep"},{"arrows":"to","to":43,"from":59,"label":"StepsTo CallStep"},{"arrows":"to","to":60,"from":59,"label":"SubTerm 1"},{"arrows":"to","to":83,"from":59,"label":"SubTerm 0"},{"arrows":"to","to":51,"from":61,"label":"StepsTo BoringStep"},{"arrows":"to","to":31,"from":62,"label":"StepsTo PrimStep"},{"arrows":"to","to":57,"from":62,"label":"SubTerm 1"},{"arrows":"to","to":63,"from":62,"label":"SubTerm 0"},{"arrows":"to","to":32,"from":64,"label":"SubTerm 1"},{"arrows":"to","to":51,"from":64,"label":"SubTerm 0"},{"arrows":"to","to":65,"from":64,"label":"StepsTo BoringStep"},{"arrows":"to","to":4,"from":65,"label":"SubTerm 1"},{"arrows":"to","to":37,"from":65,"label":"StepsTo PrimStep"},{"arrows":"to","to":51,"from":65,"label":"SubTerm 0"},{"arrows":"to","to":31,"from":66,"label":"SubTerm 1"},{"arrows":"to","to":51,"from":66,"label":"SubTerm 0"},{"arrows":"to","to":64,"from":66,"label":"StepsTo CallStep"},{"arrows":"to","to":1,"from":67,"label":"StepsTo ReturnStep"},{"arrows":"to","to":1,"from":67,"label":"SubTerm 1"},{"arrows":"to","to":12,"from":67,"label":"SubTerm 2"},{"arrows":"to","to":80,"from":67,"label":"SubTerm 0"},{"arrows":"to","to":70,"from":69,"label":"SubTerm 1"},{"arrows":"to","to":72,"from":69,"label":"SubTerm 0"},{"arrows":"to","to":71,"from":70,"label":"SubTerm 1"},{"arrows":"to","to":75,"from":70,"label":"SubTerm 0"},{"arrows":"to","to":20,"from":73,"label":"StepsTo BoringStep"},{"arrows":"to","to":20,"from":74,"label":"StepsTo BoringStep"},{"arrows":"to","to":2,"from":76,"label":"SubTerm 1"},{"arrows":"to","to":20,"from":76,"label":"SubTerm 0"},{"arrows":"to","to":45,"from":76,"label":"StepsTo BoringStep"},{"arrows":"to","to":51,"from":77,"label":"StepsTo BoringStep"},{"arrows":"to","to":9,"from":79,"label":"StepsTo ReturnStep"},{"arrows":"to","to":20,"from":79,"label":"SubTerm 0"},{"arrows":"to","to":37,"from":79,"label":"SubTerm 1"}],"nodes":[{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":6},"env":[["n_1","1"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[3,6,"Redex"]],"id":0,"label":"if 1 <= 0\nthen true\nelse n_1 * fac (n_1 - 1)"},{"span":{"startLine":3,"endLine":3,"endCol":9,"startCol":5},"env":[],"annots":[],"id":1,"label":"true"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"],["n_1","1"]],"annots":[[9,3,"Redex"]],"id":2,"label":"1 * fac (n_1 - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"],["n_1","1"]],"annots":[[5,3,"Redex"]],"id":3,"label":"fac (n_1 - 1)"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":6},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[3,6,"Redex"]],"id":4,"label":"if 0 <= 0\nthen true\nelse n_2 * fac (n_2 - 1)"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":6},"env":[],"annots":[[0,6,"Redex"]],"id":5,"label":"0 <= 0"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"],["n","2"]],"annots":[[9,1,"Redex"]],"id":6,"label":"2 * fac (n - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[8,7,"Redex"]],"id":7,"label":"2 * fac (2 - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":5},"env":[],"annots":[[4,10,"Redex"]],"id":9,"label":"2 * (1 * true)"},{"span":{"startLine":2,"endLine":5,"endCol":19,"startCol":3},"env":[["n_1","1"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[0,43,"Redex"]],"id":10,"label":"if false\nthen true\nelse n_1 * fac (n_1 - 1)"},{"span":null,"env":[],"annots":[],"id":11,"label":"false"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":5},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[],"id":12,"label":"n_2 * fac (n_2 - 1)"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":11},"env":[],"annots":[],"id":13,"label":"0"},{"span":{"startLine":5,"endLine":5,"endCol":6,"startCol":5},"env":[["n_2","0"]],"annots":[],"id":14,"label":"n_2"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[9,5,"Redex"]],"id":15,"label":"2 * (1 * fac 0)"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[13,3,"Redex"]],"id":16,"label":"2 * (1 * (if n_2 <= 0\n          then true\n          else n_2 * fac (n_2 - 1)))"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n_1","1"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[3,3,"Redex"]],"id":17,"label":"if n_1 <= 0\nthen true\nelse n_1 * fac (n_1 - 1)"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n_1","1"]],"annots":[[0,3,"Redex"]],"id":18,"label":"n_1 <= 0"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[4,5,"Redex"]],"id":19,"label":"2 * fac 1"},{"span":{"startLine":7,"endLine":7,"endCol":14,"startCol":13},"env":[],"annots":[],"id":20,"label":"2"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":6},"env":[["n","2"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[3,6,"Redex"]],"id":21,"label":"if 2 <= 0\nthen true\nelse n * fac (n - 1)"},{"span":{"startLine":3,"endLine":3,"endCol":9,"startCol":5},"env":[],"annots":[],"id":22,"label":"true"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n_1","1"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[8,3,"Redex"]],"id":23,"label":"2 * (if n_1 <= 0\n     then true\n     else n_1 * fac (n_1 - 1))"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"],["n","2"]],"annots":[[5,1,"Redex"]],"id":24,"label":"fac (n - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["n","2"]],"annots":[[0,1,"Redex"]],"id":25,"label":"n - 1"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":6},"env":[],"annots":[[0,6,"Redex"]],"id":26,"label":"1 <= 0"},{"span":{"startLine":5,"endLine":5,"endCol":6,"startCol":5},"env":[["n_1","1"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[0,3,"Redex"]],"id":27,"label":"n_1 * fac (n_1 - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":6,"startCol":5},"env":[["n","2"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[0,1,"Redex"]],"id":28,"label":"n * fac (n - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":14},"env":[],"annots":[[0,5,"Redex"]],"id":29,"label":"2 - 1"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":18},"env":[],"annots":[],"id":30,"label":"1"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[0,5,"Redex"]],"id":31,"label":"fac 0"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[3,3,"Redex"]],"id":32,"label":"if n_2 <= 0\nthen true\nelse n_2 * fac (n_2 - 1)"},{"span":{"startLine":2,"endLine":5,"endCol":19,"startCol":3},"env":[["n_1","1"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[4,55,"Redex"]],"id":33,"label":"2 * (if false\n     then true\n     else n_1 * fac (n_1 - 1))"},{"span":{"startLine":5,"endLine":5,"endCol":6,"startCol":5},"env":[["n_1","1"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[5,3,"Redex"]],"id":34,"label":"2 * (n_1 * fac (n_1 - 1))"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":6},"env":[["n_1","1"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[8,6,"Redex"]],"id":35,"label":"2 * (if 1 <= 0\n     then true\n     else n_1 * fac (n_1 - 1))"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n_2","0"]],"annots":[[0,3,"Redex"]],"id":36,"label":"n_2 <= 0"},{"span":{"startLine":2,"endLine":5,"endCol":19,"startCol":3},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[4,54,"Redex"]],"id":37,"label":"1 * (if true\n     then true\n     else n_2 * fac (n_2 - 1))"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[4,7,"Redex"]],"id":39,"label":"fac (2 - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":12,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[],"id":40,"label":"fac"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[0,5,"Redex"]],"id":41,"label":"fac 1"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":5},"env":[],"annots":[[0,8,"Redex"]],"id":42,"label":"1 * true"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n","2"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[3,1,"Redex"]],"id":43,"label":"if n <= 0\nthen true\nelse n * fac (n - 1)"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n","2"]],"annots":[[0,1,"Redex"]],"id":44,"label":"n <= 0"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[13,7,"Redex"]],"id":45,"label":"2 * (1 * fac (1 - 1))"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[8,7,"Redex"]],"id":46,"label":"1 * fac (1 - 1)"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":6},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[13,6,"Redex"]],"id":48,"label":"2 * (1 * (if 0 <= 0\n          then true\n          else n_2 * fac (n_2 - 1)))"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":6},"env":[],"annots":[[0,6,"Redex"]],"id":49,"label":"2 <= 0"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["n_1","1"]],"annots":[[0,3,"Redex"]],"id":50,"label":"n_1"},{"span":null,"env":[],"annots":[],"id":51,"label":"1"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n","2"]],"annots":[[0,1,"Redex"]],"id":52,"label":"n"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n_2","0"]],"annots":[[0,3,"Redex"]],"id":53,"label":"n_2"},{"span":null,"env":[],"annots":[],"id":54,"label":"0"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["n_1","1"]],"annots":[[0,3,"Redex"]],"id":55,"label":"n_1 - 1"},{"span":{"startLine":2,"endLine":5,"endCol":19,"startCol":3},"env":[["n","2"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[0,39,"Redex"]],"id":56,"label":"if false\nthen true\nelse n * fac (n - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":14},"env":[],"annots":[[0,5,"Redex"]],"id":57,"label":"1 - 1"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":18},"env":[],"annots":[],"id":58,"label":"1"},{"span":{"startLine":7,"endLine":7,"endCol":14,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[0,5,"Redex"]],"id":59,"label":"fac 2"},{"span":{"startLine":7,"endLine":7,"endCol":14,"startCol":13},"env":[],"annots":[],"id":60,"label":"2"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n_1","1"]],"annots":[[0,3,"Redex"]],"id":61,"label":"n_1"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[4,7,"Redex"]],"id":62,"label":"fac (1 - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":12,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[],"id":63,"label":"fac"},{"span":{"startLine":2,"endLine":2,"endCol":7,"startCol":6},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[8,3,"Redex"]],"id":64,"label":"1 * (if n_2 <= 0\n     then true\n     else n_2 * fac (n_2 - 1))"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":6},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[8,6,"Redex"]],"id":65,"label":"1 * (if 0 <= 0\n     then true\n     else n_2 * fac (n_2 - 1))"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[4,5,"Redex"]],"id":66,"label":"1 * fac 0"},{"span":{"startLine":2,"endLine":5,"endCol":19,"startCol":3},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[0,42,"Redex"]],"id":67,"label":"if true\nthen true\nelse n_2 * fac (n_2 - 1)"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":11},"env":[],"annots":[],"id":68,"label":"0"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"],["n_2","0"]],"annots":[],"id":69,"label":"fac (n_2 - 1)"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":14},"env":[["n_2","0"]],"annots":[],"id":70,"label":"n_2 - 1"},{"span":{"startLine":5,"endLine":5,"endCol":19,"startCol":18},"env":[],"annots":[],"id":71,"label":"1"},{"span":{"startLine":5,"endLine":5,"endCol":12,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[],"id":72,"label":"fac"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["n","2"]],"annots":[[0,1,"Redex"]],"id":73,"label":"n"},{"span":{"startLine":5,"endLine":5,"endCol":6,"startCol":5},"env":[["n","2"]],"annots":[[0,1,"Redex"]],"id":74,"label":"n"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["n_2","0"]],"annots":[],"id":75,"label":"n_2"},{"span":{"startLine":5,"endLine":5,"endCol":15,"startCol":14},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"],["n_1","1"]],"annots":[[14,3,"Redex"]],"id":76,"label":"2 * (1 * fac (n_1 - 1))"},{"span":{"startLine":5,"endLine":5,"endCol":6,"startCol":5},"env":[["n_1","1"]],"annots":[[0,3,"Redex"]],"id":77,"label":"n_1"},{"span":null,"env":[],"annots":[],"id":78,"label":"1"},{"span":{"startLine":2,"endLine":5,"endCol":19,"startCol":3},"env":[["n_2","0"],["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[[9,64,"Redex"]],"id":79,"label":"2 * (1 * (if true\n          then true\n          else n_2 * fac (n_2 - 1)))"},{"span":null,"env":[],"annots":[],"id":80,"label":"true"},{"span":null,"env":[],"annots":[],"id":81,"label":"0"},{"span":{"startLine":2,"endLine":2,"endCol":12,"startCol":11},"env":[],"annots":[],"id":82,"label":"0"},{"span":{"startLine":7,"endLine":7,"endCol":12,"startCol":9},"env":[["fac","fun n ->\n  if n <= 0\n  then true\n  else n * fac (n - 1)"]],"annots":[],"id":83,"label":"fac"},{"span":null,"env":[],"annots":[],"id":84,"label":"false"}]}
