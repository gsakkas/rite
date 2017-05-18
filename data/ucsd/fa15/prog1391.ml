
let rec wwhile (f,b) = failwith "to be written";;

let fixpoint (f,b) = wwhile ((failwith "to be written"), b);;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let x = wwhile (f b) in if x = b then fixpoint (f, x) else x;;

let _ =
  let g x = truncate (1e6 *. (cos (1e-6 *. (float x)))) in fixpoint (g, 0);;
