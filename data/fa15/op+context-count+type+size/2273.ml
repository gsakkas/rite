
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
(2,11)-(2,62)
(2,13)-(2,62)
(2,17)-(2,62)
(2,25)-(2,26)
(2,25)-(2,28)
(2,27)-(2,28)
(2,32)-(2,62)
(2,38)-(2,39)
(2,52)-(2,62)
(2,53)-(2,54)
(2,56)-(2,61)
(4,16)-(5,72)
*)

(* type error slice
(2,3)-(2,64)
(2,11)-(2,62)
(2,25)-(2,26)
(2,25)-(2,28)
(7,29)-(7,44)
(7,30)-(7,36)
(7,37)-(7,43)
*)
