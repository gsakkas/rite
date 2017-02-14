
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
(16,7)-(17,13)
(16,19)-(16,45)
(16,40)-(16,43)
(16,40)-(16,45)
(16,52)-(16,55)
(16,52)-(16,74)
(16,58)-(16,60)
(16,64)-(16,67)
(16,64)-(16,74)
(16,72)-(16,74)
(17,12)-(17,13)
(18,5)-(20,52)
(18,16)-(18,18)
(19,5)-(20,52)
(20,5)-(20,52)
(20,49)-(20,52)
(21,15)-(21,18)
(21,20)-(21,27)
(21,20)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
*)

(* type error slice
(15,5)-(20,52)
(15,11)-(17,13)
(15,13)-(17,13)
(16,7)-(17,13)
(16,40)-(16,43)
(16,40)-(16,45)
(16,44)-(16,45)
(16,52)-(17,13)
(16,52)-(17,13)
(17,12)-(17,13)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
*)
