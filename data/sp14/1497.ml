
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
(7,2)-(7,21)
(7,16)-(7,19)
*)

(* type error slice
(6,22)-(6,47)
(6,23)-(6,34)
(6,38)-(6,46)
(7,2)-(7,13)
(7,2)-(7,21)
(7,16)-(7,19)
*)

(* all spans
(2,14)-(7,21)
(2,16)-(7,21)
(3,2)-(7,21)
(3,22)-(6,47)
(3,25)-(6,47)
(4,4)-(6,47)
(4,10)-(4,16)
(4,10)-(4,12)
(4,15)-(4,16)
(5,15)-(5,17)
(6,16)-(6,47)
(6,16)-(6,18)
(6,22)-(6,47)
(6,23)-(6,34)
(6,35)-(6,37)
(6,38)-(6,46)
(6,39)-(6,41)
(6,44)-(6,45)
(7,2)-(7,21)
(7,2)-(7,13)
(7,14)-(7,15)
(7,16)-(7,19)
(7,20)-(7,21)
*)
