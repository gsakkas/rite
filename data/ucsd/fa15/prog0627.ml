
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;
