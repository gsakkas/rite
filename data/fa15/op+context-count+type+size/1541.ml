
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
      match a with
      | h::t ->
          let sum = ((fst x) + (snd x)) + (fst h) in (sum / 10) ::
            (sum mod 10) :: t in
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
(16,6)-(19,29)
(16,12)-(16,13)
(18,10)-(19,29)
(18,20)-(18,49)
(18,42)-(18,49)
(18,43)-(18,46)
(18,47)-(18,48)
(18,53)-(19,29)
(18,54)-(18,57)
(18,60)-(18,62)
(19,13)-(19,16)
(19,21)-(19,23)
(20,4)-(22,51)
(22,4)-(22,51)
(22,48)-(22,51)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)

(* type error slice
(15,4)-(22,51)
(15,10)-(19,29)
(15,12)-(19,29)
(16,6)-(19,29)
(16,6)-(19,29)
(16,6)-(19,29)
(16,6)-(19,29)
(16,12)-(16,13)
(18,10)-(19,29)
(18,42)-(18,49)
(18,43)-(18,46)
(18,47)-(18,48)
(18,53)-(18,63)
(18,53)-(19,29)
(18,53)-(19,29)
(19,12)-(19,24)
(19,12)-(19,29)
(19,12)-(19,29)
(19,28)-(19,29)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
*)
