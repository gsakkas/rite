
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile (fun x  -> ((b, ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile ((fun x  -> (b, ((f b) = b))), b);;

*)

(* changed spans
(6,28)-(6,61)
(6,40)-(6,56)
*)

(* type error slice
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(6,21)-(6,27)
(6,21)-(6,61)
(6,28)-(6,61)
*)
