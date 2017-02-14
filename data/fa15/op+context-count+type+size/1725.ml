
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
(16,7)-(16,74)
(16,19)-(16,45)
(16,40)-(16,43)
(16,40)-(16,45)
(16,52)-(16,55)
(16,52)-(16,74)
(16,58)-(16,60)
(16,64)-(16,67)
(16,64)-(16,74)
(16,72)-(16,74)
(17,5)-(19,52)
(17,16)-(17,18)
(18,5)-(19,52)
(19,5)-(19,52)
(19,49)-(19,52)
(20,3)-(20,13)
(20,15)-(20,18)
(20,15)-(20,33)
(20,20)-(20,27)
(20,20)-(20,33)
(20,28)-(20,30)
(20,31)-(20,33)
*)

(* type error slice
(15,5)-(19,52)
(15,11)-(16,74)
(16,40)-(16,43)
(16,40)-(16,45)
(16,44)-(16,45)
(17,5)-(19,52)
(17,16)-(17,18)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,36)-(19,40)
*)
