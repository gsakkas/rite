
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x abs n;;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

*)

(* changed spans
(7,3)-(7,22)
clonehelper x (abs n)
AppG [VarG,AppG [EmptyG]]

*)

(* type error slice
(6,23)-(6,48)
(6,24)-(6,35)
(6,39)-(6,47)
(7,3)-(7,14)
(7,3)-(7,22)
(7,17)-(7,20)
*)
