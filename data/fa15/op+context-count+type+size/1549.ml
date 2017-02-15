
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | h::t ->
          (match h with
           | (fir,sec) ->
               (match a with
                | h::t -> ((fir + sec) + (h / 10)) ::
                    (((fir + sec) + h) mod 10) :: t)) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
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
(18,6)-(24,53)
(18,12)-(18,13)
(20,10)-(24,53)
(20,17)-(20,18)
(22,15)-(24,52)
(22,22)-(22,23)
(23,26)-(23,50)
(23,27)-(23,38)
(23,28)-(23,31)
(23,34)-(23,37)
(23,42)-(23,43)
(23,46)-(23,48)
(24,22)-(24,33)
(24,23)-(24,26)
(24,29)-(24,32)
(24,43)-(24,45)
(25,4)-(27,51)
(25,15)-(25,17)
(26,4)-(27,51)
(27,4)-(27,51)
(27,48)-(27,51)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)

(* type error slice
(17,4)-(27,51)
(17,10)-(24,53)
(17,12)-(24,53)
(18,6)-(24,53)
(18,6)-(24,53)
(18,12)-(18,13)
(26,4)-(27,51)
(26,15)-(26,23)
(26,15)-(26,44)
(26,24)-(26,44)
(26,25)-(26,37)
(27,18)-(27,32)
(27,18)-(27,44)
(27,33)-(27,34)
(27,40)-(27,44)
*)
