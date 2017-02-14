
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun b  -> (((f b), ((f b) != b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) != b))), b);;

*)

(* changed spans
(5,30)-(5,65)
(5,43)-(5,60)
*)

(* type error slice
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,55)
(5,22)-(5,28)
(5,22)-(5,65)
(5,30)-(5,65)
*)
