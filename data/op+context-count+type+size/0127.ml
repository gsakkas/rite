
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (lh1::lt1,lh2::lt2) ->
          (match x with
           | (h1,h2) ->
               (match h1 with
                | x::y ->
                    (match h2 with
                     | a::b ->
                         (((((x + a) + lh1) / 10) :: lt1),
                           ((((x + a) + lh1) mod 10) :: lt2))))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (v1,v2) -> ([v1], [v2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,7)-(24,60)
(15,13)-(15,14)
(17,12)-(24,60)
(17,18)-(17,19)
(19,17)-(24,60)
(19,23)-(19,25)
(21,22)-(24,60)
(21,28)-(21,30)
(23,31)-(23,32)
(23,31)-(23,36)
(23,31)-(23,43)
(23,31)-(23,49)
(23,31)-(23,57)
(23,31)-(24,60)
(23,35)-(23,36)
(23,40)-(23,43)
(23,47)-(23,49)
(23,54)-(23,57)
(24,32)-(24,37)
(24,32)-(24,44)
(24,32)-(24,52)
(24,32)-(24,60)
(24,36)-(24,37)
(24,41)-(24,44)
(24,50)-(24,52)
(24,57)-(24,60)
(25,5)-(27,52)
(25,17)-(25,19)
(28,3)-(28,33)
*)

(* type error slice
(2,41)-(2,46)
(2,41)-(2,55)
(2,47)-(2,48)
(2,50)-(2,55)
(4,4)-(7,80)
(4,13)-(7,76)
(4,16)-(7,76)
(5,3)-(7,76)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(6,10)-(6,21)
(6,10)-(6,72)
(6,10)-(6,77)
(6,23)-(6,28)
(6,23)-(6,66)
(6,29)-(6,30)
(6,33)-(6,66)
(6,70)-(6,72)
(6,75)-(6,77)
(13,3)-(28,33)
(13,12)-(27,52)
(14,5)-(27,52)
(14,11)-(24,60)
(14,13)-(24,60)
(15,7)-(24,60)
(15,13)-(15,14)
(17,12)-(24,60)
(17,18)-(17,19)
(19,17)-(24,60)
(19,23)-(19,25)
(21,22)-(24,60)
(21,28)-(21,30)
(23,31)-(23,57)
(23,31)-(24,60)
(24,32)-(24,60)
(25,5)-(27,52)
(25,17)-(25,19)
(25,17)-(25,23)
(25,21)-(25,23)
(26,5)-(27,52)
(26,16)-(26,28)
(26,16)-(26,34)
(26,29)-(26,31)
(26,32)-(26,34)
(27,5)-(27,52)
(27,19)-(27,33)
(27,19)-(27,45)
(27,34)-(27,35)
(27,36)-(27,40)
(27,41)-(27,45)
(27,49)-(27,52)
(28,15)-(28,18)
(28,15)-(28,33)
(28,20)-(28,27)
(28,20)-(28,33)
(28,28)-(28,30)
(28,31)-(28,33)
*)
