
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x not) = x)) in f'), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((let f' x = ((f x), (not ((f x) = x))) in f'), b);;

*)

(* changed spans
(4,50)-(4,65)
not (f x = x)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,80)
(2,17)-(2,78)
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,67)-(2,69)
(4,22)-(4,28)
(4,22)-(4,77)
(4,29)-(4,77)
(4,30)-(4,73)
(4,38)-(4,66)
(4,42)-(4,66)
(4,43)-(4,48)
(4,44)-(4,45)
(4,50)-(4,65)
(4,51)-(4,60)
(4,52)-(4,53)
(4,63)-(4,64)
(4,70)-(4,72)
*)
