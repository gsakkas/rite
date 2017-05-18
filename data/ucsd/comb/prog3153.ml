
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (let func x x = ((f b), ((f b) = b)) in (func, b));;
