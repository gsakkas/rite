
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
(4,55)-(4,60)
clonehelper
VarG

(5,2)-(5,21)
clonehelper x (abs n)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(5,16)-(5,19)
abs n
AppG (fromList [VarG])

*)
