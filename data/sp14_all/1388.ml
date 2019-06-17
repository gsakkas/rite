
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0 then (((clone (-1)) * (l l2)), l2) else (l1, (clone l l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l2), l2)
  else (l1, ((clone 0 l) @ l2));;

*)

(* changed spans
(6,18)-(6,41)
clone 0 ((-1) * l) @ l2
AppG [AppG [EmptyG,EmptyG],VarG]

(6,57)-(6,69)
clone 0 l @ l2
AppG [AppG [EmptyG,EmptyG],VarG]

*)

(* type error slice
(2,49)-(2,66)
(2,50)-(2,55)
(5,3)-(6,70)
(5,11)-(5,46)
(6,18)-(6,41)
(6,19)-(6,31)
(6,20)-(6,25)
(6,34)-(6,40)
(6,35)-(6,36)
(6,57)-(6,69)
(6,58)-(6,63)
*)
