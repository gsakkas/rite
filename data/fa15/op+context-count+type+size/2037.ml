
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
    let f a x = let (x1::x3,x2::x4) = x in [x1 + x2] :: a in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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
(22,17)-(22,58)
(22,44)-(22,58)
(22,57)-(22,58)
(23,5)-(24,69)
(23,16)-(23,18)
(24,5)-(24,69)
(24,16)-(24,18)
(24,22)-(24,69)
(24,36)-(24,62)
(25,15)-(25,18)
(25,20)-(25,27)
(25,20)-(25,33)
(25,28)-(25,30)
(25,31)-(25,33)
*)

(* type error slice
(22,5)-(24,69)
(22,11)-(22,58)
(22,44)-(22,58)
(22,57)-(22,58)
(24,22)-(24,69)
(24,36)-(24,50)
(24,36)-(24,62)
(24,51)-(24,52)
*)
