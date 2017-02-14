
let helper x r = let m = x r in match m with | r -> (r, false);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(2,12)-(2,62)
(2,14)-(2,62)
(2,18)-(2,62)
(2,26)-(2,27)
(2,26)-(2,29)
(2,28)-(2,29)
(2,33)-(2,62)
(2,39)-(2,40)
(2,54)-(2,55)
(2,54)-(2,62)
(2,57)-(2,62)
(4,17)-(5,72)
*)

(* type error slice
(2,4)-(2,65)
(2,12)-(2,62)
(2,26)-(2,27)
(2,26)-(2,29)
(7,31)-(7,37)
(7,31)-(7,43)
(7,39)-(7,43)
*)
