
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
    let f a x = match l1 with | [] -> (0, []) | h::t -> (0, ((x + h) :: a)) in
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
(17,17)-(17,74)
(17,23)-(17,25)
(17,40)-(17,41)
(17,40)-(17,45)
(17,43)-(17,45)
(17,58)-(17,59)
(17,58)-(17,74)
(17,63)-(17,64)
(17,67)-(17,68)
(17,73)-(17,74)
(18,5)-(19,69)
(18,17)-(18,22)
(18,20)-(18,22)
(19,5)-(19,69)
(19,16)-(19,18)
(19,22)-(19,69)
(19,36)-(19,50)
(19,36)-(19,62)
(19,51)-(19,52)
(19,53)-(19,57)
(19,58)-(19,62)
(19,66)-(19,69)
(20,3)-(20,13)
(20,3)-(20,54)
(20,15)-(20,18)
(20,15)-(20,54)
(20,20)-(20,27)
(20,20)-(20,54)
(20,29)-(20,37)
(20,29)-(20,40)
(20,38)-(20,40)
(20,43)-(20,51)
(20,43)-(20,54)
(20,52)-(20,54)
*)

(* type error slice
(17,5)-(19,69)
(17,11)-(17,74)
(17,13)-(17,74)
(17,17)-(17,74)
(17,58)-(17,74)
(17,63)-(17,74)
(17,73)-(17,74)
(19,36)-(19,50)
(19,36)-(19,62)
(19,51)-(19,52)
*)
