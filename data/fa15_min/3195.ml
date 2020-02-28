
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
      let c::c' = a2 in
      ([((x1 + x2) + c) / 10], (a2 @ [((x1 + x2) + c) mod 10])) in
    let base = (0, [0]) in
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
      let c::c' = a2 in
      ((((x1 + x2) + c) / 10), (a2 @ [((x1 + x2) + c) mod 10])) in
    let base = (0, [0]) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,8)-(28,30)
((x1 + x2) + c) / 10
BopG (BopG EmptyG EmptyG) LitG

*)

(* type error slice
(24,5)-(31,52)
(24,11)-(28,64)
(24,13)-(28,64)
(25,7)-(28,64)
(26,7)-(28,64)
(27,7)-(28,64)
(28,7)-(28,64)
(28,8)-(28,30)
(29,5)-(31,52)
(29,16)-(29,24)
(29,17)-(29,18)
(31,19)-(31,33)
(31,19)-(31,45)
(31,34)-(31,35)
(31,36)-(31,40)
*)
