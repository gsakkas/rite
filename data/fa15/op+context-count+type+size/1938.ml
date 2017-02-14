
let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match l1 with | [] -> [] | h::t -> (0, ((x + h) :: a)) in
    let base = (0, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;


(* fix

let rec clone x n =
  if n < 1 then [] else if n = 1 then [x] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      if sum > 9
      then (1, (((sum - 10) + (fst a)) :: (snd a)))
      else (0, ((sum + (fst a)) :: (snd a))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero (List.rev l1) (List.rev l2)));;

*)

(* changed spans
(17,16)-(17,70)
(17,22)-(17,24)
(17,38)-(17,40)
(17,51)-(17,70)
(17,52)-(17,53)
(17,57)-(17,58)
(17,61)-(17,62)
(17,67)-(17,68)
(18,4)-(19,68)
(18,15)-(18,22)
(18,19)-(18,21)
(19,4)-(19,68)
(19,15)-(19,17)
(19,21)-(19,68)
(19,35)-(19,49)
(19,35)-(19,61)
(19,50)-(19,51)
(19,52)-(19,56)
(19,57)-(19,61)
(19,65)-(19,68)
(20,2)-(20,12)
(20,2)-(20,56)
(20,13)-(20,56)
(20,14)-(20,17)
(20,18)-(20,55)
(20,19)-(20,26)
(20,27)-(20,40)
(20,28)-(20,36)
(20,37)-(20,39)
(20,41)-(20,54)
(20,42)-(20,50)
(20,51)-(20,53)
*)

(* type error slice
(17,4)-(19,68)
(17,10)-(17,70)
(17,16)-(17,70)
(17,16)-(17,70)
(17,38)-(17,40)
(17,51)-(17,70)
(17,55)-(17,69)
(17,67)-(17,68)
(18,4)-(19,68)
(18,15)-(18,22)
(19,35)-(19,49)
(19,35)-(19,61)
(19,50)-(19,51)
(19,52)-(19,56)
*)
