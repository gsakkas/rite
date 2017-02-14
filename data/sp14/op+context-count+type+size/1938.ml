
let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let (b',c) = ((f b), ((f b) <> b)) in wwhile ((b', c), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',true ) -> wwhile (f, b') | (b',false ) -> b';;

let fixpoint (f,b) =
  let f b = let b' = f b in (b', ((f b) <> b)) in wwhile (f, b);;

*)

(* changed spans
(6,3)-(6,59)
(6,18)-(6,21)
(6,18)-(6,35)
(6,26)-(6,35)
(6,50)-(6,52)
(6,50)-(6,55)
(6,54)-(6,55)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,34)-(3,40)
(3,34)-(3,47)
(3,42)-(3,43)
(3,42)-(3,47)
(6,41)-(6,47)
(6,41)-(6,59)
(6,50)-(6,55)
(6,50)-(6,59)
*)
