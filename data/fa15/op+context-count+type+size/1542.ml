
let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = ((fst x) + (snd x)) + (fst a) in ((sum / 10), (sum mod 10)) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then padZero (0 :: l1) l2
  else
    if (List.length l1) > (List.length l2)
    then padZero l1 (0 :: l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,6)-(16,75)
(16,16)-(16,45)
(16,38)-(16,45)
(16,39)-(16,42)
(16,49)-(16,75)
(16,51)-(16,54)
(16,57)-(16,59)
(16,62)-(16,74)
(16,63)-(16,66)
(16,71)-(16,73)
(17,4)-(19,51)
(17,15)-(17,17)
(18,4)-(19,51)
(19,4)-(19,51)
(19,48)-(19,51)
(20,2)-(20,12)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(15,4)-(19,51)
(15,10)-(16,75)
(16,38)-(16,45)
(16,39)-(16,42)
(16,43)-(16,44)
(17,4)-(19,51)
(17,15)-(17,17)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
*)
