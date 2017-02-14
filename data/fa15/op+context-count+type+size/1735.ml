
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
                | (first,second) ->
                    ((((first + second) + b) / 10),
                      ((((first + second) + b) mod 10) :: t)))) in
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
(18,7)-(25,60)
(18,13)-(18,14)
(20,12)-(25,60)
(20,18)-(20,19)
(22,17)-(25,60)
(22,23)-(22,24)
(24,25)-(24,30)
(24,25)-(24,39)
(24,25)-(24,50)
(24,25)-(25,60)
(24,33)-(24,39)
(25,27)-(25,32)
(25,27)-(25,41)
(25,35)-(25,41)
(26,5)-(28,52)
(26,16)-(26,18)
(27,5)-(28,52)
(28,5)-(28,52)
(28,49)-(28,52)
(29,20)-(29,27)
(29,28)-(29,30)
(29,31)-(29,33)
*)

(* type error slice
(17,5)-(28,52)
(17,11)-(25,60)
(17,13)-(25,60)
(18,7)-(25,60)
(18,7)-(25,60)
(18,7)-(25,60)
(18,7)-(25,60)
(18,13)-(18,14)
(20,12)-(25,60)
(20,12)-(25,60)
(20,18)-(20,19)
(22,17)-(25,60)
(24,25)-(25,60)
(25,27)-(25,54)
(25,27)-(25,60)
(25,27)-(25,60)
(25,59)-(25,60)
(28,19)-(28,33)
(28,19)-(28,45)
(28,34)-(28,35)
*)
