
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let f' b = ((f b), (b = (f b))) in f'), b);;

*)

(* changed spans
(5,29)-(5,44)
(5,30)-(5,36)
(5,37)-(5,43)
(5,38)-(5,39)
(5,46)-(5,47)
*)

(* type error slice
(3,2)-(3,58)
(3,15)-(3,16)
(3,15)-(3,18)
(3,22)-(3,58)
(3,22)-(3,58)
(3,36)-(3,38)
(3,44)-(3,50)
(3,44)-(3,58)
(3,51)-(3,58)
(3,52)-(3,53)
(5,21)-(5,27)
(5,21)-(5,48)
(5,28)-(5,48)
(5,29)-(5,44)
(5,30)-(5,36)
*)
