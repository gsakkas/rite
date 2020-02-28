
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

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
      let (c,a2) = a in
      let s::s' = a2 in
      (([s + c] @ (s' @ [((x1 + x2) + c) mod 10])), [((x1 + x2) + c) / 10]) in
    let base = ([0], [0]) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

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
      let (c,a2) = a in
      let s::s' = a2 in
      ((((x1 + x2) + c) / 10), ([s + c] @ (s' @ [((x1 + x2) + c) mod 10]))) in
    let base = (0, [0]) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(26,8)-(26,51)
((x1 + x2) + c) / 10
BopG (BopG EmptyG EmptyG) LitG

(26,53)-(26,75)
[s + c] @ (s' @ [((x1 + x2) + c) mod 10])
AppG [ListG [EmptyG],AppG [EmptyG,EmptyG]]

(27,17)-(27,20)
0
LitG

*)

(* type error slice
(22,5)-(29,52)
(22,11)-(26,76)
(22,13)-(26,76)
(23,7)-(26,76)
(24,7)-(26,76)
(24,20)-(24,21)
(25,7)-(26,76)
(26,7)-(26,76)
(26,8)-(26,51)
(26,10)-(26,15)
(26,14)-(26,15)
(26,17)-(26,18)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
*)
