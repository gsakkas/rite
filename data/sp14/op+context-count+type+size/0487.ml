
let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let l1 = List.length l1 in
  let l2 = List.length l2 in
  (((clone 0 (l2 - l1)) @ l1), ((clone 0 (l1 - l2)) @ l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | _ -> if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let ll1 = List.length l1 in
  let ll2 = List.length l2 in
  (((clone 0 (ll2 - ll1)) @ l1), ((clone 0 (ll1 - ll2)) @ l2));;

*)

(* changed spans
(6,2)-(8,58)
(7,2)-(8,58)
(8,14)-(8,16)
(8,19)-(8,21)
(8,26)-(8,28)
(8,42)-(8,44)
(8,47)-(8,49)
(8,54)-(8,56)
*)

(* type error slice
(6,2)-(8,58)
(6,11)-(6,22)
(6,11)-(6,25)
(7,2)-(8,58)
(7,11)-(7,22)
(7,11)-(7,25)
(8,3)-(8,29)
(8,24)-(8,25)
(8,26)-(8,28)
(8,31)-(8,57)
(8,52)-(8,53)
(8,54)-(8,56)
*)
