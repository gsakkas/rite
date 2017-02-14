
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
(6,2)-(6,59)
(6,15)-(6,36)
(6,16)-(6,21)
(6,23)-(6,35)
(6,48)-(6,55)
(6,49)-(6,51)
(6,53)-(6,54)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,33)-(3,39)
(3,33)-(3,47)
(3,40)-(3,47)
(3,41)-(3,42)
(6,40)-(6,46)
(6,40)-(6,59)
(6,47)-(6,59)
(6,48)-(6,55)
*)
