
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let x = 1.0;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in ((y x), b));;
