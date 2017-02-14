
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (i,j) ->
          (match a with
           | (m,n) ->
               (match n with
                | [] -> []
                | h::t ->
                    if ((i + j) + m) >= 10
                    then (1, (1 :: (((i + j) + m) - 10) :: t))
                    else (0, (0 :: ((i + j) + m) :: t)))) in
    let base = (0, [0]) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (i,j) ->
          (match a with
           | (m,n) ->
               (match n with
                | [] -> (0, [])
                | h::t ->
                    if ((i + j) + m) >= 10
                    then (1, (1 :: (((i + j) + m) - 10) :: t))
                    else (0, (0 :: ((i + j) + m) :: t)))) in
    let base = (0, [0]) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,25)-(20,27)
*)

(* type error slice
(14,5)-(27,52)
(14,11)-(24,54)
(14,13)-(24,54)
(15,7)-(24,54)
(17,12)-(24,54)
(17,12)-(24,54)
(17,18)-(17,19)
(19,17)-(24,54)
(19,17)-(24,54)
(20,25)-(20,27)
(22,21)-(24,54)
(23,27)-(23,61)
(27,19)-(27,33)
(27,19)-(27,45)
(27,34)-(27,35)
*)
