
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
(2,11)-(3,64)
(2,13)-(3,64)
(3,2)-(3,64)
(3,10)-(3,11)
(3,10)-(3,13)
(3,12)-(3,13)
(3,17)-(3,64)
(3,23)-(3,24)
(3,37)-(3,47)
(3,38)-(3,39)
(3,41)-(3,46)
(3,55)-(3,64)
(3,56)-(3,57)
(3,59)-(3,63)
(5,16)-(6,72)
(6,2)-(6,72)
*)

(* type error slice
(2,3)-(3,66)
(2,11)-(3,64)
(3,10)-(3,11)
(3,10)-(3,13)
(8,29)-(8,44)
(8,30)-(8,36)
(8,37)-(8,43)
*)
