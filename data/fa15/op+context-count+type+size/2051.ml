
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

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
      let (y,z) = x in
      let b::b' = y in let c::c' = z in ([b + c], ([b + c] @ a)) in
    let base = [] in
    let args = padZero l1 l2 in
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
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(3,46)-(3,49)
(3,46)-(3,67)
(3,50)-(3,51)
(5,7)-(5,12)
(5,11)-(5,12)
(8,3)-(15,41)
(9,3)-(15,41)
(20,9)-(20,66)
(23,3)-(30,33)
(24,5)-(29,52)
(25,7)-(26,63)
(26,7)-(26,63)
(26,19)-(26,20)
(26,24)-(26,63)
(26,36)-(26,37)
(26,43)-(26,44)
(26,47)-(26,48)
(26,52)-(26,59)
(26,52)-(26,63)
(26,53)-(26,54)
(26,53)-(26,58)
(26,57)-(26,58)
(26,60)-(26,61)
(26,62)-(26,63)
(27,5)-(29,52)
(27,16)-(27,18)
(28,5)-(29,52)
(28,16)-(28,23)
(28,16)-(28,29)
(29,5)-(29,52)
*)

(* type error slice
(24,5)-(29,52)
(24,11)-(26,63)
(24,13)-(26,63)
(25,7)-(26,63)
(26,7)-(26,63)
(26,24)-(26,63)
(26,42)-(26,63)
(26,52)-(26,63)
(26,60)-(26,61)
(26,62)-(26,63)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
*)
