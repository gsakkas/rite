
let rec wwhile (f,b) =
  match f b with | (k,tf) -> if tf = false then k else wwhile (f, k);;

let fixpoint (f,b) = wwhile (fun a  -> ((f a), ((f a) != a), b));;
