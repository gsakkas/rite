
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (fun y  -> fun b  -> if (f b) = b then (b, true) else ((y b), b));;
