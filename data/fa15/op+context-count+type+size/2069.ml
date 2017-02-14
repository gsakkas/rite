
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
      let ax::a' = a in
      let (a1,a2) = ax in
      ([((x1 + x2) + a1) / 10], [((x1 + x2) + a1) mod 10]) in
    let base = ([], []) in
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
    let f a x = let (x1,x2) = x in ([(x1 + x2) / 10], [(x1 + x2) mod 10]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,6)-(26,58)
(24,6)-(26,58)
(24,19)-(24,20)
(25,6)-(26,58)
(25,20)-(25,22)
(26,9)-(26,18)
(26,21)-(26,23)
(26,34)-(26,43)
(26,46)-(26,48)
(27,4)-(29,51)
(28,4)-(29,51)
(29,4)-(29,51)
*)

(* type error slice
(22,4)-(29,51)
(22,10)-(26,58)
(22,12)-(26,58)
(23,6)-(26,58)
(24,6)-(26,58)
(24,6)-(26,58)
(24,6)-(26,58)
(24,19)-(24,20)
(25,6)-(26,58)
(26,6)-(26,58)
(29,18)-(29,32)
(29,18)-(29,44)
(29,33)-(29,34)
*)
