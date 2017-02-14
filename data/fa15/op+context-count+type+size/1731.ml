
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
      match a with
      | h::t ->
          (match h with
           | (b,c) ->
               (match x with
                | (first,second) -> (((first + second) + b) / 10) ::
                    (((first + second) + b) mod 10) :: t)) in
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
(18,7)-(24,57)
(18,13)-(18,14)
(20,12)-(24,57)
(20,18)-(20,19)
(22,17)-(24,57)
(22,23)-(22,24)
(23,40)-(23,45)
(23,40)-(23,54)
(23,40)-(24,57)
(23,48)-(23,54)
(24,24)-(24,29)
(24,24)-(24,38)
(24,32)-(24,38)
(25,5)-(27,52)
(25,16)-(25,18)
(26,5)-(27,52)
(27,5)-(27,52)
(27,49)-(27,52)
(28,20)-(28,27)
(28,28)-(28,30)
(28,31)-(28,33)
*)

(* type error slice
(17,5)-(27,52)
(17,11)-(24,57)
(18,7)-(24,57)
(18,7)-(24,57)
(18,7)-(24,57)
(18,13)-(18,14)
(20,12)-(24,57)
(20,18)-(20,19)
(24,24)-(24,51)
(24,24)-(24,57)
(24,24)-(24,57)
(24,56)-(24,57)
(27,5)-(27,52)
(27,19)-(27,33)
(27,19)-(27,45)
(27,34)-(27,35)
*)
