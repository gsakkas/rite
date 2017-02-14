
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
(6,30)-(6,60)
(6,42)-(6,55)
*)

(* type error slice
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,55)
(6,22)-(6,28)
(6,22)-(6,60)
(6,30)-(6,60)
*)
