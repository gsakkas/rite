
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
      let (c,ax) = a in ((((x1 + x2) + c) mod 10), [((x1 + x2) + c) / 10]) in
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
    let f a x = let (x1,x2) = x in ([(x1 + x2) mod 10], [(x1 + x2) / 10]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,6)-(24,74)
(24,6)-(24,74)
(24,19)-(24,20)
(24,25)-(24,49)
(24,27)-(24,36)
(24,39)-(24,40)
(24,53)-(24,62)
(24,65)-(24,66)
(25,4)-(27,51)
(26,4)-(27,51)
(27,4)-(27,51)
*)

(* type error slice
(22,4)-(27,51)
(22,10)-(24,74)
(24,6)-(24,74)
(24,19)-(24,20)
(24,26)-(24,41)
(24,39)-(24,40)
(25,4)-(27,51)
(25,15)-(25,23)
(25,16)-(25,18)
(27,18)-(27,32)
(27,18)-(27,44)
(27,33)-(27,34)
(27,35)-(27,39)
*)
