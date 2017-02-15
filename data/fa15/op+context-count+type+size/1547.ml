
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
      let sum = ((fst x) + (snd x)) + (fst a) in ((sum / 10), (sum mod 10))
        :: a in
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
(16,6)-(17,12)
(16,16)-(16,45)
(16,38)-(16,45)
(16,39)-(16,42)
(16,49)-(16,75)
(16,51)-(16,54)
(16,57)-(16,59)
(16,62)-(16,74)
(16,63)-(16,66)
(16,71)-(16,73)
(17,11)-(17,12)
(18,4)-(20,51)
(18,15)-(18,17)
(19,4)-(20,51)
(20,4)-(20,51)
(20,48)-(20,51)
(21,14)-(21,17)
(21,18)-(21,33)
(21,19)-(21,26)
(21,27)-(21,29)
(21,30)-(21,32)
*)

(* type error slice
(15,4)-(20,51)
(15,10)-(17,12)
(15,12)-(17,12)
(16,6)-(17,12)
(16,38)-(16,45)
(16,39)-(16,42)
(16,43)-(16,44)
(16,49)-(17,12)
(16,49)-(17,12)
(17,11)-(17,12)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
*)
