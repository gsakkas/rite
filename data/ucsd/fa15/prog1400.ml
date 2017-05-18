
let notEqual x y = (x = y) = false;;

let fixpoint (f,b) =
  let newFunc b = ((f b), (notEqual b f b)) in wwhile (newFunc, b);;
