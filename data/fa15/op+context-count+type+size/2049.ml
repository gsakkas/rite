
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
(3,45)-(3,48)
(3,45)-(3,68)
(3,49)-(3,50)
(5,6)-(5,11)
(5,10)-(5,11)
(8,2)-(15,41)
(9,2)-(15,41)
(20,7)-(20,66)
(23,2)-(30,34)
(24,4)-(29,51)
(25,6)-(26,64)
(26,6)-(26,64)
(26,18)-(26,19)
(26,23)-(26,64)
(26,35)-(26,36)
(26,42)-(26,43)
(26,46)-(26,47)
(26,50)-(26,63)
(26,51)-(26,58)
(26,52)-(26,53)
(26,52)-(26,57)
(26,56)-(26,57)
(26,59)-(26,60)
(26,61)-(26,62)
(27,4)-(29,51)
(27,15)-(27,17)
(28,4)-(29,51)
(28,15)-(28,22)
(28,15)-(28,28)
(29,4)-(29,51)
*)

(* type error slice
(24,4)-(29,51)
(24,10)-(26,64)
(24,12)-(26,64)
(25,6)-(26,64)
(26,6)-(26,64)
(26,23)-(26,64)
(26,40)-(26,64)
(26,50)-(26,63)
(26,59)-(26,60)
(26,61)-(26,62)
(29,18)-(29,32)
(29,18)-(29,44)
(29,33)-(29,34)
*)
