
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
      if (List.length a1) = 0
      then ((((x1 + x2) / 10) @ [0]), ((x1 + x2) mod 10))
      else
        (let c::c' = a1 in
         ((a1 @ [((x1 + x2) + c) / 10]), (((x1 + x2) + c) mod 10))) in
    let base = ([], []) in
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
      if (List.length a1) = 0
      then ([(x1 + x2) / 10; 0], [(x1 + x2) mod 10])
      else
        (let c::c' = a1 in
         ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10]))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,16)-(28,36)
(28,31)-(28,32)
(28,33)-(28,36)
(28,41)-(28,56)
(31,45)-(31,65)
*)

(* type error slice
(24,5)-(34,52)
(24,11)-(31,65)
(24,13)-(31,65)
(25,7)-(31,65)
(26,7)-(31,65)
(27,7)-(31,65)
(28,16)-(28,29)
(28,16)-(28,36)
(28,31)-(28,32)
(30,10)-(31,65)
(31,12)-(31,65)
(31,45)-(31,65)
(32,5)-(34,52)
(32,17)-(32,23)
(32,21)-(32,23)
(34,19)-(34,33)
(34,19)-(34,45)
(34,34)-(34,35)
(34,36)-(34,40)
*)
