
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then clone 0 ((List.length l1) - (List.length l2))
  else
    if (List.length l1) < (List.length l2)
    then clone 0 ((List.length l2) - (List.length l1))
    else [];;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,7)-(6,12)
(6,7)-(6,52)
(8,4)-(10,11)
(9,9)-(9,14)
(9,9)-(9,54)
(10,9)-(10,11)
(12,19)-(12,51)
(12,23)-(12,31)
(12,23)-(12,51)
(12,32)-(12,51)
(14,11)-(20,34)
(15,2)-(20,34)
(16,4)-(19,51)
(16,16)-(16,24)
(16,16)-(16,44)
(16,25)-(16,44)
(17,4)-(19,51)
(17,15)-(17,23)
(17,15)-(17,43)
(17,24)-(17,43)
(18,4)-(19,51)
(18,15)-(18,23)
(18,15)-(18,43)
(18,24)-(18,43)
(19,4)-(19,51)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,12)
(20,2)-(20,34)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(2,43)-(2,65)
(2,48)-(2,65)
(2,49)-(2,54)
(4,3)-(10,13)
(4,12)-(10,11)
(4,15)-(10,11)
(5,2)-(10,11)
(6,7)-(6,12)
(6,7)-(6,52)
(15,2)-(20,34)
(15,11)-(19,51)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
*)
