var nodes = undefined;
var edges = undefined;
var steps = undefined;
var network = undefined;
var stack = [];

var sf_target = undefined;
var sb_target = undefined;
var jf_target = undefined;
var jb_target = undefined;

var single_width = 1;
var multi_width = 5;

var func_input = undefined;
var check_btn = undefined;
var editor = undefined;
var safe_banner = undefined;
var unsafe_banner = undefined;

var demos = {
  factorial: [ "let rec fac n ="
             , "  if n = 0 then"
             , "    true"
             , "  else"
             , "    n * fac (n - 1)"
             ].join('\n'),

  wwhile: [ "let (x,y) = (\"5\", 5);;"
          , "let rec wwhile (f,b) ="
          , "  let f b = (x, y) in "
          , "  if y = true "
          , "  then wwhile (f, x)"
          , "  else x"
          ].join('\n'),

  loop: [ "let f lst ="
        , "  let rec loop lst acc ="
        , "    if lst = [] then"
        , "      acc"
        , "    else"
        , "      ()"
        , "  in"
        , "  match loop lst [(0.0,0.0)] with"
        , "    | h :: t -> h"
        ].join('\n'),

  palindrome: [ "let listReverse l ="
              , "  let rec helper xs = function "
              , "    | [] -> xs "
              , "    | hd::tl -> helper (hd :: xs) tl "
              , "  in helper []"
              , ""
              , "let palindrome (w : char list) ="
              , "  if (listReverse w) = w "
              , "  then true "
              , "  else false"
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

  document.getElementById('step-forward').disabled = true;
  document.getElementById('step-backward').disabled = true;
  document.getElementById('jump-forward').disabled = true;
  document.getElementById('jump-backward').disabled = true;
}

function isSingleStep(from, to) {
  return allEdges.get({filter: function(x) {
      return x.from === from && x.to === to;
    }}).length > 0;
}

function canStepUndo() {
  console.log('canStepUndo');
  if (stack.length >= 2) {
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
  stack.pop()
  network.setData(stack[stack.length-1]);
  canStepUndo();
}

function canStepForward(node) {
  // ctxmenu.style.visibility = 'hidden';
  console.log('stepForward');
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
  console.log('stepBackward');
  var inn = allEdges.get({filter: function(x) {
    return x.to === node.id && x.label.indexOf('StepsTo') >= 0;
  }});
  var curEdge = network.body.data.edges.get({filter: function(x) {
    return x.to === node.id;
  }});
  // console.log(inn);
  if (inn.length === 0 || curEdge.length === 0 || network.body.data.nodes.get(inn[0].from) !== null) return;
  // console.log(network.body.data.nodes.get(inn[0]));
  inn = inn[0];
  curEdge = curEdge[0];
  // console.log(inn);
  sb_target = [inn.from, curEdge];
  document.getElementById('step-backward').disabled = false;
  // insertNode(allNodes.get(prev[0].from), edge);
}

function stepBackward() {
  insertNode(allNodes.get(sb_target[0]), sb_target[1]);
  resetButtons();
}

function canJumpForward(node) {
  // ctxmenu.style.visibility = 'hidden';
  console.log('jumpForward');
  var out = allEdges.get({filter: function(x) {
    return x.from === node.id &&
           x.label.indexOf('StepsTo') >= 0; // &&
           // x.label.indexOf('StepsTo CallStep') < 0;
  }});
  var curEdge = network.body.data.edges.get({filter: function(x) {
    return x.from === node.id;
  }});
  if (out.length === 0 || curEdge.length === 0) return;
  out = out[0];
  curEdge = curEdge[0];
  while (true) {
    var outEdges = allEdges.get({filter: function(x) {
      return x.from === out.to &&
             x.label.indexOf('StepsTo') >= 0;
    }});
    // console.log(outEdges);
    if (outEdges.length === 0) break;
    if (outEdges[0].label === 'StepsTo CallStep') break;
    out = outEdges[0];
  }
  // if (isSingleStep(node.id, out.to)) return;
  if (network.body.data.nodes.get(out.to) !== null) return;
  // console.log(out);
  jf_target = [out.to, curEdge];
  document.getElementById('jump-forward').disabled = false;
  // insertNode(allNodes.get(next.from), edge);
}

function jumpForward() {
  insertNode(allNodes.get(jf_target[0]), jf_target[1]);
  resetButtons();
}

function canJumpBackward(node) {
  // ctxmenu.style.visibility = 'hidden';
  console.log('jumpBackward');
  var inn = allEdges.get({filter: function(x) {
    return x.to === node.id &&
           x.label.indexOf('StepsTo') >= 0; // &&
           // x.label.indexOf('StepsTo CallStep') < 0;
  }});
  var curEdge = network.body.data.edges.get({filter: function(x) {
    return x.to === node.id;
  }});
  if (inn.length === 0 || curEdge.length === 0) return;
  inn = inn[0];
  curEdge = curEdge[0];
  while (true) {
    innEdges = allEdges.get({filter: function(x) {
      return x.to === inn.from &&
             x.label.indexOf('StepsTo') >= 0;
    }});
    // console.log(innEdges);
    if (innEdges.length === 0) break;
    inn = innEdges[0];
    if (inn.label === 'StepsTo CallStep') break;
  }
  // if (isSingleStep(inn.from, node.id)) return;
  if (network.body.data.nodes.get(inn.from) !== null) return;
  // console.log(inn);
  jb_target = [inn.from, curEdge];
  document.getElementById('jump-backward').disabled = false;
  // insertNode(allNodes.get(prev.from), edge);
}

function jumpBackward() {
  insertNode(allNodes.get(jb_target[0]), jb_target[1]);
  resetButtons();
}

function insertNode(node, replacingEdge) {
  // IMPORTANT: copy the dataset so we can save state between operations
  var pnodes = new vis.DataSet(network.body.data.nodes.get());
  var pedges = new vis.DataSet(network.body.data.edges.get());

  if (allEdges.get({filter: function(x) {
        return x.from === replacingEdge.from && x.to === node.id;
      }}).length > 0) {
    var width_in = single_width;
  } else {
    var width_in = multi_width;
  }
  if (allEdges.get({filter: function(x) {
        return x.from === node.id && x.to === replacingEdge.to;
      }}).length > 0) {
    var width_out = single_width;
  } else {
    var width_out = multi_width;
  }

  pnodes.add(node);
  pedges.add([{arrows: 'to', from: replacingEdge.from, to: node.id, width: width_in}
             ,{arrows: 'to', from: node.id, to: replacingEdge.to, width: width_out}]);
  pedges.remove(replacingEdge);

  var newData = {nodes: pnodes, edges: pedges};
  // console.log(newData);
  stack.push(newData);
  network.setData(newData);
  network.unselectAll();
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
          notifySafe();
        } else if (data.result === 'stuck') {
          notifyUnsafe(data.reason);
        }
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
      hierarchical: { direction: 'UD', sortMethod: 'directed' }
    },
    nodes: {
      font: { face: 'monospace' }
    },
    // edges: {
    //   label: "",
    // },
    // physics: { enabled: false},
  };
  var newData = {nodes: nodes, edges: edges};
  stack.push(newData);
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
        // console.log(node);
        canStepForward(node);
        canStepBackward(node);
        canJumpForward(node);
        canJumpBackward(node);
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
