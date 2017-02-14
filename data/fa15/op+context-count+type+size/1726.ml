
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
    let base = [()] in
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
(16,7)-(19,30)
(16,13)-(16,14)
(18,11)-(19,30)
(18,23)-(18,49)
(18,44)-(18,47)
(18,44)-(18,49)
(18,48)-(18,49)
(18,55)-(18,58)
(18,55)-(19,30)
(18,61)-(18,63)
(19,14)-(19,17)
(19,22)-(19,24)
(20,5)-(22,52)
(20,16)-(20,20)
(20,17)-(20,19)
(22,5)-(22,52)
(22,49)-(22,52)
(23,20)-(23,27)
(23,28)-(23,30)
(23,31)-(23,33)
*)

(* type error slice
(15,5)-(22,52)
(15,11)-(19,30)
(15,13)-(19,30)
(16,7)-(19,30)
(16,7)-(19,30)
(16,7)-(19,30)
(16,7)-(19,30)
(16,13)-(16,14)
(18,11)-(19,30)
(18,44)-(18,47)
(18,44)-(18,49)
(18,48)-(18,49)
(18,55)-(18,63)
(18,55)-(19,30)
(18,55)-(19,30)
(19,14)-(19,24)
(19,14)-(19,30)
(19,14)-(19,30)
(19,29)-(19,30)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
*)
