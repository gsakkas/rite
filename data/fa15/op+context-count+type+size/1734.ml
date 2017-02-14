
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
    let args = List.combine l1 l2 in
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
(18,7)-(24,52)
(18,13)-(18,14)
(20,12)-(24,52)
(20,18)-(20,19)
(22,17)-(24,52)
(22,23)-(22,24)
(23,29)-(23,32)
(23,29)-(23,38)
(23,29)-(23,49)
(23,35)-(23,38)
(23,43)-(23,44)
(23,47)-(23,49)
(24,24)-(24,27)
(24,24)-(24,33)
(24,30)-(24,33)
(24,44)-(24,46)
(25,5)-(27,52)
(25,16)-(25,18)
(26,5)-(27,52)
(26,16)-(26,34)
(27,5)-(27,52)
(27,49)-(27,52)
(28,15)-(28,18)
(28,20)-(28,27)
(28,20)-(28,33)
(28,28)-(28,30)
(28,31)-(28,33)
*)

(* type error slice
(17,5)-(27,52)
(17,11)-(24,52)
(17,13)-(24,52)
(18,7)-(24,52)
(18,7)-(24,52)
(18,13)-(18,14)
(26,5)-(27,52)
(26,16)-(26,28)
(26,16)-(26,34)
(27,19)-(27,33)
(27,19)-(27,45)
(27,34)-(27,35)
(27,41)-(27,45)
*)
