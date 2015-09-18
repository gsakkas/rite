var nodes = undefined;
var edges = undefined;
var steps = undefined;
var network = undefined;
var ctxmenu = undefined;

var sf_target = undefined;
var sb_target = undefined;
var jf_target = undefined;
var jb_target = undefined;

var single_width = 1;
var multi_width = 5;

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

function canStepForward() {
  // ctxmenu.style.visibility = 'hidden';
  console.log('stepForward');
  var edge = network.body.data.edges.get(network.getSelectedEdges()[0]);
  console.log(edge);
  var next = allEdges.get({filter: function(x) {
    return x.from === edge.from && x.label.indexOf('StepsTo') >= 0;
  }});
  if (next.length === 0 || network.body.data.nodes.get(next[0].to) !== null) return;
  console.log(network.body.data.nodes.get(next[0]));
  next = next[0];
  console.log(next);
  sf_target = [next.to, edge];
  document.getElementById('step-forward').disabled = false;
  // insertNode(allNodes.get(next.from), edge);
}

function stepForward() {
  insertNode(allNodes.get(sf_target[0]), sf_target[1]);
  resetButtons();
}

function canStepBackward() {
  // ctxmenu.style.visibility = 'hidden';
  console.log('stepBackward');
  var edge = network.body.data.edges.get(network.getSelectedEdges()[0]);
  console.log(edge);
  var prev = allEdges.get({filter: function(x) {
    return x.to === edge.to && x.label.indexOf('StepsTo') >= 0;
  }});
  console.log(prev);
  if (prev.length === 0 || network.body.data.nodes.get(prev[0].from) !== null) return;
  console.log(network.body.data.nodes.get(prev[0]));
  prev = prev[0];
  console.log(prev);
  sb_target = [prev.from, edge];
  document.getElementById('step-backward').disabled = false;
  // insertNode(allNodes.get(prev[0].from), edge);
}

function stepBackward() {
  insertNode(allNodes.get(sb_target[0]), sb_target[1]);
  resetButtons();
}

function canJumpForward() {
  // ctxmenu.style.visibility = 'hidden';
  console.log('jumpForward');
  var edge = network.body.data.edges.get(network.getSelectedEdges()[0]);
  console.log(edge);
  if (isSingleStep(edge.from, edge.to)) return;
  var next = allEdges.get({filter: function(x) {
    return x.from === edge.from &&
           x.label.indexOf('StepsTo') >= 0 &&
           x.label.indexOf('StepsTo CallStep') < 0;
  }});
  if (next.length === 0) return;
  next = next[0];
  while (true) {
    nextNodes = allEdges.get({filter: function(x) {
      return x.from === next.to &&
             x.label.indexOf('StepsTo') >= 0;
    }});
    console.log(nextNodes);
    if (nextNodes.length === 0) break;
    next = nextNodes[0];
    if (next.label === 'StepsTo CallStep') break;
  }
  if (network.body.data.nodes.get(next.to) !== null) return;
  console.log(next);
  jf_target = [next.to, edge];
  document.getElementById('jump-forward').disabled = false;
  // insertNode(allNodes.get(next.from), edge);
}

function jumpForward() {
  insertNode(allNodes.get(jf_target[0]), jf_target[1]);
  resetButtons();
}

function canJumpBackward() {
  // ctxmenu.style.visibility = 'hidden';
  console.log('jumpBackward');
  var edge = network.body.data.edges.get(network.getSelectedEdges()[0]);
  console.log(edge);
  if (isSingleStep(edge.from, edge.to)) return;
  var prev = allEdges.get({filter: function(x) {
    return x.to === edge.to &&
           x.label.indexOf('StepsTo') >= 0 &&
           x.label.indexOf('StepsTo CallStep') < 0;
  }});
  if (prev.length === 0) return;
  prev = prev[0];
  while (true) {
    prevNodes = allEdges.get({filter: function(x) {
      return x.to === prev.from &&
             x.label.indexOf('StepsTo') >= 0;
    }});
    console.log(prevNodes);
    if (prevNodes.length === 0) break;
    prev = prevNodes[0];
    if (prev.label === 'StepsTo CallStep') break;
  }
  if (network.body.data.nodes.get(prev.from) !== null) return;
  console.log(prev);
  jb_target = [prev.from, edge];
  document.getElementById('jump-backward').disabled = false;
  // insertNode(allNodes.get(prev.from), edge);
}

function jumpBackward() {
  console.log(jb_target);
  insertNode(allNodes.get(jb_target[0]), jb_target[1]);
  resetButtons();
}

function insertNode(node, replacingEdge) {
  var pnodes = network.body.data.nodes;
  var pedges = network.body.data.edges;

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

  network.setData({nodes: pnodes, edges: pedges});
  network.unselectAll();
  // network.stabilize();
  // network.redraw();
}

function draw() {
  ctxmenu = document.getElementById('menu');
  var container = document.getElementById('vis');
  var dot = document.getElementById('reduction-graph').text;
  var root = document.getElementById('root-node').text;
  var stuck = document.getElementById('stuck-node').text;
  data = vis.network.convertDot(dot);
  data.nodes.forEach(function(n) {
    n.label = n.label.replace(/\\n/g, "\n");
  });
  allNodes = new vis.DataSet(data.nodes);
  allEdges = new vis.DataSet(data.edges);
  var nodes = new vis.DataSet(data.nodes).get({filter: function(x) {
    return x.id === ('u' + root) || x.id === ('u' + stuck);
  }});
  if (allEdges.get({filter: function(x) {
        return x.from === ('u'+root) && x.to === ('u'+stuck);
      }}).length > 0) {
    var width = single_width;
  } else {
    var width = multi_width;
  }
  var edges = new vis.DataSet([{ arrows: 'to', from: ('u'+root), to: ('u'+stuck), width: width}]);
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
  network = new vis.Network(container, {nodes: nodes, edges: edges}, options);
    // network.on("hidePopup", function () {
    //     console.log('hidePopup Event');
    // });
    // network.on("select", function (params) {
    //     console.log('select Event:', params);
    // });
    // network.on("oncontext", function (params) {
    //     console.log('oncontext Event:', params);
    // });
    // network.on("selectNode", function (params) {
    //     console.log('selectNode Event:', params);
    //     canStepForward();
    //     canStepBackward();
    //     canJumpForward();
    //     canJumpBackward();
    //     // ctxmenu.style.position = 'fixed';
    //     // ctxmenu.style.top  = params.event.center.x;
    //     // ctxmenu.style.left = params.event.center.y;
    //     // ctxmenu.style.visibility = 'visible';
    //     // ctxmenu.style.zIndex = 1;
    // });
    network.on("selectEdge", function (params) {
        console.log('selectEdge Event:', params);
        canStepForward();
        canStepBackward();
        canJumpForward();
        canJumpBackward();
    });
    // network.on("deselectNode", function (params) {
    //     console.log('deselectNode Event:', params);
    //     resetButtons();
    // });
    network.on("deselectEdge", function (params) {
        console.log('deselectEdge Event:', params);
        resetButtons();
    });
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
