
let f x = let xx = (x * x) * x in (xx, (xx < 1000));;

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (fr,b) =
  wwhile ((let n z = let xx = f in (xx, (b = (f b))) in n), b);;
