
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
      let (a1,a2) = a in
      match a1 with
      | [] -> ((a2 @ [(x1 + x2) mod 10]), (a1 @ [(x1 + x2) / 10]))
      | _ -> ((a1 :: 3), (a2 :: 5)) in
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
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      match a1 with
      | [] -> ((a2 @ [(x1 + x2) mod 10]), (a1 @ [(x1 + x2) / 10]))
      | _ -> ((a1 @ [3]), (a2 @ [5])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(27,16)-(27,18)
(27,16)-(27,23)
(27,22)-(27,23)
(27,27)-(27,29)
(27,27)-(27,34)
(27,33)-(27,34)
(31,20)-(31,27)
(31,28)-(31,30)
(31,31)-(31,33)
*)

(* type error slice
(25,7)-(27,34)
(25,7)-(27,34)
(26,17)-(26,40)
(26,17)-(26,65)
(26,20)-(26,21)
(26,22)-(26,40)
(26,22)-(26,40)
(26,24)-(26,39)
(26,44)-(26,46)
(26,44)-(26,65)
(26,47)-(26,48)
(27,16)-(27,18)
(27,16)-(27,23)
(27,16)-(27,23)
(27,16)-(27,23)
(27,16)-(27,34)
(27,22)-(27,23)
(27,27)-(27,34)
(27,33)-(27,34)
*)
