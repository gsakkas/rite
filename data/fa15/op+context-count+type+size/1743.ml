
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((match f b with | b -> b | _ -> (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,68)
(5,36)-(5,39)
(5,52)-(5,53)
(5,61)-(5,67)
(5,70)-(5,71)
*)

(* type error slice
(5,29)-(5,68)
(5,29)-(5,68)
(5,29)-(5,68)
(5,36)-(5,37)
(5,36)-(5,39)
(5,52)-(5,53)
(5,61)-(5,67)
(5,62)-(5,63)
*)
