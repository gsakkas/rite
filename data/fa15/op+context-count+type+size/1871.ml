
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (List.length a1) = 0
      then ((((x1 + x2) / 10) @ [0]), ((x1 + x2) mod 10))
      else
        (let c::c' = a1 in
         ((a1 @ [((x1 + x2) + c) / 10]), (((x1 + x2) + c) mod 10))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (List.length a1) = 0
      then ([(x1 + x2) / 10; 0], [(x1 + x2) mod 10])
      else
        (let c::c' = a1 in
         ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10]))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,12)-(28,36)
(28,30)-(28,31)
(28,32)-(28,35)
(28,38)-(28,56)
(31,41)-(31,65)
*)

(* type error slice
(24,4)-(34,51)
(24,10)-(31,67)
(24,12)-(31,67)
(25,6)-(31,67)
(26,6)-(31,67)
(27,6)-(31,67)
(28,12)-(28,36)
(28,13)-(28,29)
(28,30)-(28,31)
(30,8)-(31,67)
(31,9)-(31,66)
(31,41)-(31,65)
(32,4)-(34,51)
(32,15)-(32,23)
(32,20)-(32,22)
(34,18)-(34,32)
(34,18)-(34,44)
(34,33)-(34,34)
(34,35)-(34,39)
*)
