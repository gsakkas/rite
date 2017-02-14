
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

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
    let f a x = let c y = let (b,d) = y in [b + d] in (c x) @ a in
    let base = ([], []) in
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
(22,17)-(22,64)
(22,23)-(22,51)
(22,27)-(22,51)
(22,39)-(22,40)
(22,44)-(22,51)
(22,45)-(22,46)
(22,49)-(22,50)
(22,56)-(22,57)
(22,56)-(22,59)
(22,56)-(22,64)
(22,58)-(22,59)
(22,61)-(22,62)
(22,63)-(22,64)
(23,5)-(25,52)
(24,16)-(24,23)
*)

(* type error slice
(22,5)-(25,52)
(22,11)-(22,64)
(22,56)-(22,64)
(22,61)-(22,62)
(22,63)-(22,64)
(23,5)-(25,52)
(23,17)-(23,23)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
*)
