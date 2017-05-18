
let fpHelper (f,x,y) =
  let n = f x in match n with | y -> (n, false) | _ -> (n, false);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fpHelper (f, b)), b);;
