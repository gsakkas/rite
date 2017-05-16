
let rec wwhile (f,b) = failwith "to be written";;

let fixpoint (f,b) = wwhile ((failwith "to be written"), b);;

let fixpoint (f,b) =
  let x = wwhile (f b) in if x = b then fixpoint (f, x) else x;;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let x = wwhile (f b) in if x = b then b else fixpoint (f, x);;

let fixpoint (f,b) =
  let x = wwhile (f b) in match x with | b -> b | _ -> fixpoint (f, x);;

let rec wwhile (f,b) =
  let z = f b in
  match z with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  let x = wwhile (f, b) in if x = b then b else fixpoint (f, x);;
