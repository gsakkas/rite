
let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with | true  -> [] | false  -> tx :: (clone tx (tn - 1)) in
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
(4,55)-(4,74)
clonehelper tx (tn - 1)
AppG [VarG,BopG EmptyG EmptyG]

(5,3)-(5,22)
clonehelper x (abs n)
AppG [VarG,AppG [EmptyG]]

*)

(* type error slice
(3,3)-(5,22)
(3,23)-(4,74)
(3,26)-(4,74)
(4,11)-(4,13)
(4,11)-(4,17)
(4,16)-(4,17)
(5,3)-(5,14)
(5,3)-(5,22)
(5,17)-(5,20)
*)
