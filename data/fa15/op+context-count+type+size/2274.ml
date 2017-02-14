
let rec helper (f,b) =
  let x = f b in match x with | b -> (x, false) | _ -> helper (f, x);;

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
(3,3)-(3,68)
(3,11)-(3,14)
(3,18)-(3,68)
(3,24)-(3,25)
(3,42)-(3,47)
(3,56)-(3,62)
(3,56)-(3,68)
(3,64)-(3,65)
(3,64)-(3,68)
(5,17)-(6,72)
(6,3)-(6,72)
*)

(* type error slice
(3,18)-(3,68)
(3,18)-(3,68)
(3,39)-(3,47)
(3,56)-(3,62)
(3,56)-(3,68)
(6,15)-(6,16)
(6,15)-(6,18)
(6,60)-(6,66)
(6,60)-(6,72)
(6,68)-(6,69)
(6,68)-(6,72)
(8,22)-(8,28)
(8,22)-(8,48)
(8,31)-(8,37)
(8,31)-(8,43)
(8,31)-(8,48)
*)
