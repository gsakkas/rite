
let rec helper (f,b) =
  let (x,y) = f b in match x with | b -> (x, (x = b)) | _ -> helper (f, x);;

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
(3,2)-(3,74)
(3,14)-(3,17)
(3,21)-(3,74)
(3,27)-(3,28)
(3,45)-(3,52)
(3,61)-(3,67)
(3,61)-(3,74)
(3,68)-(3,74)
(3,72)-(3,73)
(6,2)-(6,72)
(8,46)-(8,47)
*)

(* type error slice
(3,21)-(3,74)
(3,21)-(3,74)
(3,41)-(3,53)
(3,61)-(3,67)
(3,61)-(3,74)
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
