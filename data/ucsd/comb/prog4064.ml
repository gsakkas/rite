
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (fun y  -> let x = f b in if x = b then ((x, true), b));;
