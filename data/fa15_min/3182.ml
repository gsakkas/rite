
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
      ([((x1 + x2) + a1) / 10], [[a2]; ((x1 + x2) + a1) mod 10]) in
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
(24,7)-(26,65)
([(x1 + x2) / 10] , [(x1 + x2) mod 10])
TupleG [ListG [EmptyG],ListG [EmptyG]]

*)

(* type error slice
(22,5)-(29,52)
(22,11)-(26,65)
(22,13)-(26,65)
(23,7)-(26,65)
(24,7)-(26,65)
(24,20)-(24,21)
(25,7)-(26,65)
(26,7)-(26,65)
(26,33)-(26,64)
(26,34)-(26,38)
(26,40)-(26,63)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
*)
