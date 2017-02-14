
let helper x r =
  let m = x r in match m with | r -> (r, false) | _ -> (r, true);;

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
(2,12)-(3,64)
(2,14)-(3,64)
(3,3)-(3,64)
(3,11)-(3,12)
(3,11)-(3,14)
(3,13)-(3,14)
(3,18)-(3,64)
(3,24)-(3,25)
(3,39)-(3,40)
(3,39)-(3,47)
(3,42)-(3,47)
(3,57)-(3,58)
(3,57)-(3,64)
(3,60)-(3,64)
(5,17)-(6,72)
(6,3)-(6,72)
*)

(* type error slice
(2,4)-(3,67)
(2,12)-(3,64)
(3,11)-(3,12)
(3,11)-(3,14)
(8,31)-(8,37)
(8,31)-(8,43)
(8,39)-(8,43)
*)
