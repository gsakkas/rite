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

var single_width = 1;
var multi_width = 5;

var func_input = undefined;
var check_btn = undefined;
var editor = undefined;
var mark = undefined;
var safe_banner = undefined;
var unsafe_banner = undefined;

var demos = {
  factorial: [ "let rec fac n ="
             , "  if n <= 0 then"
             , "    true"
             , "  else"
             , "    n * fac (n - 1);;"
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

  document.getElementById('step-forward').disabled = true;
  document.getElementById('step-backward').disabled = true;
  document.getElementById('jump-forward').disabled = true;
  document.getElementById('jump-backward').disabled = true;
  document.getElementById('step-into').disabled = true;
  document.getElementById('step-over').disabled = true;
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
    document.getElementById('undo').disabled = false;
  } else {
    document.getElementById('undo').disabled = true;
  }
}

function stepUndo() {
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
  document.getElementById('step-forward').disabled = false;
  // insertNode(allNodes.get(next.from), edge);
}

function stepForward() {
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
  document.getElementById('step-backward').disabled = false;
}

function stepBackward() {
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
  if (path.length === 0) return;
  for (var i = 1; i < path.length; i++) {
    var e = path[i];
    if (network.body.data.nodes.get(e.to) !== null) {
      return;
    }
    if (e.label.indexOf('CallStep') >= 0) {
      jf_target = [e.from, curEdge];
      document.getElementById('jump-forward').disabled = false;
      return;
    }
  }
}

function jumpForward() {
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
  // console.log(curEdge, path);
  if (path.length === 0) return;
  for (var i = path.length-2; i >= 0; i--) {
    var e = path[i];
    if (network.body.data.nodes.get(e.from) !== null) {
      return;
    }
    if (e.label.indexOf('CallStep') >= 0) {
      jb_target = [e.from, curEdge];
      document.getElementById('jump-backward').disabled = false;
      return;
    }
  }
}

function jumpBackward() {
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
    document.getElementById('step-over').disabled = false;
  }
}

function stepOver() {
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
  document.getElementById('step-into').disabled = false;
}

function stepInto() {
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

function notifySafe() {
  safe_banner.style.display = 'block';
}
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

  // TODO: how do i get the hash fragment and base64 decode in javascript??
  // editor.setValue(atob(window.location.hash));

  func_input = document.getElementById('var-input');
  check_btn = document.getElementById('check-btn');
  safe_banner = document.getElementById('safe-banner');
  unsafe_banner = document.getElementById('unsafe-banner');

  check_btn.onclick = function (evt) {
    evt.preventDefault();
    safe_banner.style.display = 'none';
    unsafe_banner.style.display = 'none';

    var func = func_input.text;
    var prog = editor.getValue();
    // stack = [];
    // console.log(prog);

    // send ajax request
    $.ajax({
      type: 'POST',
      url: '/check',
      data: {'prog': prog, 'var': func},
      dataType: 'json',
      success: function(data, status, xhr) {
        console.log(status, data);
        if (data.result === 'value') {

          // notifySafe();
          errors = [];
          editor.performLint();

        } else if (data.result === 'stuck') {

          // notifyUnsafe(data.reason);
          var stuckNode = data.nodes.filter(function(n) {
              return n.id === data.bad;
          })[0];
          errors = [{ from: { line: stuckNode.span.startLine - 1,
                              ch: stuckNode.span.startCol - 1},
                      to: { line: stuckNode.span.endLine - 1,
                            ch: stuckNode.span.endCol},
                      message: data.reason,
                      severity: 'error'
                    }];
          editor.performLint();

        } else if (data.result === 'timeout') {

          notifyUnsafe("Timed out on input: " + data.root);
          return;

        } else if (data.result === 'parse-error') {

          var line = data.error.match(/line (\d+)/)[1];
          var ch = data.error.match(/column (\d+)/)[1];

          errors = [{ from: { line: line - 1,
                              ch: ch - 1
                            },
                      to: { line: line - 1,
                            ch: ch
                          },
                      message: 'Parse error',
                      severity: 'error'
                    }];
          editor.performLint();
          return;

        }

        stack = [];
        resetButtons();
        draw(data);
      },
      error: function(xhr, errorType, error) {
        alert('Oh noes, something went wrong!');
        console.log(errorType, error);
      }
    });

  };
}

function draw(data) {
  // ctxmenu = document.getElementById('menu');
  var container = document.getElementById('vis');
  // var dot = data.dot; //document.getElementById('reduction-graph').text;
  var root = data.root; //document.getElementById('root-node').text;
  var stuck = data[data.result]; //document.getElementById('stuck-node').text;
  // data = vis.network.convertDot(dot);
  // data.nodes.forEach(function(n) {
  //   n.label = n.label.replace(/\\n/g, "\n");
  // });
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
      hierarchical: { direction: 'UD', sortMethod: 'directed' },
    },
    nodes: {
      font: { face: 'monospace' },
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
        console.log(node.span);
        if (node.span) {
            mark = editor.markText({line: node.span.startLine - 1, ch: node.span.startCol - 1},
                                   {line: node.span.endLine - 1, ch: node.span.endCol},
                                   {className: "CodeMirror-selected"});
        }
        // console.log(node);
        canStepForward(node);
        canStepBackward(node);
        canJumpForward(node);
        canJumpBackward(node);
        canStepInto(node);
        canStepOver(node);
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
