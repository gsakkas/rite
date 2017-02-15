
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
(18,6)-(25,63)
(18,12)-(18,13)
(20,10)-(25,63)
(20,17)-(20,18)
(22,15)-(25,62)
(22,22)-(22,23)
(24,20)-(25,61)
(24,21)-(24,50)
(24,23)-(24,39)
(24,24)-(24,29)
(24,32)-(24,38)
(25,25)-(25,41)
(25,26)-(25,31)
(25,34)-(25,40)
(26,4)-(28,51)
(26,15)-(26,17)
(27,4)-(28,51)
(28,4)-(28,51)
(28,48)-(28,51)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
*)

(* type error slice
(17,4)-(28,51)
(17,10)-(25,63)
(17,12)-(25,63)
(18,6)-(25,63)
(18,6)-(25,63)
(18,6)-(25,63)
(18,6)-(25,63)
(18,12)-(18,13)
(20,10)-(25,63)
(20,10)-(25,63)
(20,17)-(20,18)
(22,15)-(25,62)
(24,20)-(25,61)
(25,22)-(25,60)
(25,22)-(25,60)
(25,23)-(25,54)
(25,58)-(25,59)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
*)
