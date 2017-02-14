
let helper (f,b) =
  let x = f b in match x with | b -> (x, false) | _ -> (x, true);;

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
(3,2)-(3,64)
(3,10)-(3,13)
(3,17)-(3,64)
(3,23)-(3,24)
(3,41)-(3,46)
(3,55)-(3,64)
(3,59)-(3,63)
(5,16)-(6,72)
(6,2)-(6,72)
*)

(* type error slice
(2,3)-(3,66)
(2,12)-(3,64)
(3,2)-(3,64)
(3,17)-(3,64)
(3,37)-(3,47)
(6,14)-(6,15)
(6,14)-(6,17)
(6,59)-(6,65)
(6,59)-(6,72)
(6,66)-(6,72)
(6,67)-(6,68)
(8,21)-(8,27)
(8,21)-(8,48)
(8,28)-(8,48)
(8,29)-(8,44)
(8,30)-(8,36)
*)
