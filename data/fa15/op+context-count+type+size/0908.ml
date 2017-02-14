
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (fun input  -> let b = f input in ((b, (b != input)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun input  -> let b = f input in (b, (b != input))), b);;

*)

(* changed spans
(6,9)-(6,66)
(6,24)-(6,65)
(6,44)-(6,61)
*)

(* type error slice
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(6,2)-(6,8)
(6,2)-(6,66)
(6,9)-(6,66)
*)
