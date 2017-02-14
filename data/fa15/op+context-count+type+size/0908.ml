
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
(6,11)-(6,65)
(6,25)-(6,65)
(6,46)-(6,60)
*)

(* type error slice
(3,42)-(3,48)
(3,42)-(3,55)
(3,50)-(3,55)
(6,3)-(6,9)
(6,3)-(6,65)
(6,11)-(6,65)
*)
