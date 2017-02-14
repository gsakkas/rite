
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (fun x  -> (f, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,30)-(5,45)
(5,41)-(5,42)
*)

(* type error slice
(3,50)-(3,56)
(3,50)-(3,62)
(3,58)-(3,62)
(5,22)-(5,28)
(5,22)-(5,45)
(5,30)-(5,45)
*)
