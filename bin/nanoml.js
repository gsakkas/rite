var nodes = undefined;
var edges = undefined;
var steps = undefined;
var network = undefined;
var ctxmenu = undefined;

function stepForward() {
  ctxmenu.style.visibility = 'hidden';
  network.unselectAll();
}

function stepBackward() {
  ctxmenu.style.visibility = 'hidden';
  console.log('stepBackward');
  var edge = network.body.data.edges.get(network.getSelectedEdges()[0]);
  console.log(edge);
  var prev = allEdges.get({filter: function(x) { 
    return x.to === edge.to && x.label.indexOf('StepsTo') >= 0;
  }});
  console.log(prev);
  insertNode(allNodes.get(prev[0].from), edge);
}

function jumpForward() {
  ctxmenu.style.visibility = 'hidden';
  network.unselectAll();
}

function jumpBackward() {
  ctxmenu.style.visibility = 'hidden';
  network.unselectAll();
}

function insertNode(node, replacingEdge) {
  var pnodes = network.body.data.nodes;
  var pedges = network.body.data.edges;
    
  pnodes.add(node);
  pedges.add([{arrows: 'to', from: replacingEdge.from, to: node.id}
             ,{arrows: 'to', from: node.id, to: replacingEdge.to}]);
  pedges.remove(replacingEdge);

  network.setData({nodes: pnodes, edges: pedges});
  network.unselectAll();
}

function draw() {
  ctxmenu = document.getElementById('menu');
  var container = document.getElementById('vis');
  var dot = document.getElementById('reduction-graph').text;
  var root = document.getElementById('root-node').text;
  var stuck = document.getElementById('stuck-node').text;
  data = vis.network.convertDot(dot);
  allNodes = new vis.DataSet(data.nodes);
  allEdges = new vis.DataSet(data.edges);
  var nodes = new vis.DataSet(data.nodes).get({filter: function(x) {
    return x.id === ('u' + root) || x.id === ('u' + stuck);
  }});
  var edges = new vis.DataSet([{ arrows: 'to', from: ('u'+root), to: ('u'+stuck)}]);
  // steps = new vis.DataSet(data.edges).get({filter: function (x) {
  //   return x.label.indexOf("StepsTo") === 0;
  // }});
  // console.log(steps);
  var options = {
    layout: {
      hierarchical: { direction: 'LR', sortMethod: 'directed' }
    },
    // edges: {
    //   label: "",
    // },
    // physics: { enabled: false},
  };
  network = new vis.Network(container, {nodes: nodes, edges: edges}, options);
    network.on("hidePopup", function () {
        console.log('hidePopup Event');
    });
    network.on("select", function (params) {
        console.log('select Event:', params);
    });
    network.on("oncontext", function (params) {
        console.log('oncontext Event:', params);
    });
    network.on("selectNode", function (params) {
        console.log('selectNode Event:', params);
        ctxmenu.style.position = 'fixed';
        ctxmenu.style.top  = params.event.center.x;
        ctxmenu.style.left = params.event.center.y;
        ctxmenu.style.visibility = 'visible';
        ctxmenu.style.zIndex = 1;
    });
    network.on("selectEdge", function (params) {
        console.log('selectEdge Event:', params);
    });
    network.on("deselectNode", function (params) {
        console.log('deselectNode Event:', params);
    });
    network.on("deselectEdge", function (params) {
        console.log('deselectEdge Event:', params);
    });
    network.on("hoverNode", function (params) {
        console.log('hoverNode Event:', params);
    });
    network.on("hoverEdge", function (params) {
        console.log('hoverEdge Event:', params);
    });
    network.on("blurNode", function (params) {
        console.log('blurNode Event:', params);
    });
    network.on("blurEdge", function (params) {
        console.log('blurEdge Event:', params);
    });
}
