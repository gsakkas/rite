
let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((), b);;
