
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
(18,6)-(24,58)
(18,12)-(18,13)
(20,10)-(24,58)
(20,17)-(20,18)
(22,15)-(24,57)
(22,22)-(22,23)
(23,36)-(24,56)
(23,38)-(23,54)
(23,39)-(23,44)
(23,47)-(23,53)
(24,22)-(24,38)
(24,23)-(24,28)
(24,31)-(24,37)
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
(17,10)-(24,58)
(18,6)-(24,58)
(18,6)-(24,58)
(18,6)-(24,58)
(18,12)-(18,13)
(20,10)-(24,58)
(20,17)-(20,18)
(24,20)-(24,51)
(24,20)-(24,56)
(24,20)-(24,56)
(24,55)-(24,56)
(27,4)-(27,51)
(27,18)-(27,32)
(27,18)-(27,44)
(27,33)-(27,34)
*)
