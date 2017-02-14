
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> (0, (x + y)) in
    let base = [] in
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
               if ((i + j) + m) >= 10
               then (1, ((((i + j) + m) - 10) :: n))
               else (0, (((i + j) + m) :: n))) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,17)-(14,51)
(14,42)-(14,43)
(14,42)-(14,51)
(14,46)-(14,47)
(14,46)-(14,51)
(14,50)-(14,51)
(15,5)-(17,52)
(15,16)-(15,18)
(16,5)-(17,52)
(16,16)-(16,28)
(16,16)-(16,55)
(16,30)-(16,38)
(16,30)-(16,41)
(16,39)-(16,41)
(16,44)-(16,52)
(16,44)-(16,55)
(16,53)-(16,55)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,36)-(17,40)
(17,41)-(17,45)
(17,49)-(17,52)
(18,3)-(18,13)
(18,3)-(18,33)
(18,15)-(18,18)
(18,15)-(18,33)
(18,20)-(18,27)
(18,20)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
*)

(* type error slice
(14,5)-(17,52)
(14,11)-(14,51)
(14,13)-(14,51)
(14,17)-(14,51)
(14,42)-(14,51)
(15,5)-(17,52)
(15,16)-(15,18)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,36)-(17,40)
*)
