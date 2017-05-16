
let rec wwhile (f,b) =
  let (i,c) = f b in if c = true then wwhile (f, i) else i;;

let fixpoint (f,b) =
  let g x = let xx = f x in (xx, (xx = x)) in g wwhile (g, b);;
