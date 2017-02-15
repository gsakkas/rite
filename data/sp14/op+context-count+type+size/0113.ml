
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
(15,6)-(24,64)
(15,12)-(15,13)
(17,10)-(24,64)
(19,15)-(24,63)
(19,22)-(19,24)
(21,20)-(24,62)
(21,27)-(21,29)
(23,26)-(23,57)
(23,27)-(23,49)
(23,28)-(23,43)
(23,29)-(23,36)
(23,30)-(23,31)
(23,34)-(23,35)
(23,39)-(23,42)
(23,46)-(23,48)
(23,53)-(23,56)
(24,27)-(24,60)
(24,28)-(24,52)
(24,29)-(24,44)
(24,30)-(24,37)
(24,31)-(24,32)
(24,35)-(24,36)
(24,40)-(24,43)
(24,49)-(24,51)
(24,56)-(24,59)
(25,4)-(27,51)
(25,15)-(25,23)
(26,4)-(27,51)
(26,15)-(26,27)
(26,15)-(26,33)
*)

(* type error slice
(2,34)-(2,35)
(2,34)-(2,56)
(2,34)-(2,56)
(2,39)-(2,56)
(2,40)-(2,45)
(2,46)-(2,47)
(4,3)-(7,79)
(4,12)-(7,77)
(4,15)-(7,77)
(5,2)-(7,77)
(6,7)-(6,77)
(6,21)-(6,68)
(6,22)-(6,27)
(6,28)-(6,29)
(6,74)-(6,76)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,73)-(7,75)
(13,2)-(28,34)
(13,11)-(27,51)
(14,4)-(27,51)
(14,10)-(24,64)
(14,12)-(24,64)
(17,10)-(24,64)
(17,17)-(17,18)
(21,20)-(24,62)
(21,20)-(24,62)
(21,27)-(21,29)
(26,4)-(27,51)
(26,15)-(26,27)
(26,15)-(26,33)
(26,31)-(26,33)
(27,18)-(27,32)
(27,18)-(27,44)
(27,33)-(27,34)
(27,40)-(27,44)
(28,13)-(28,34)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
*)
