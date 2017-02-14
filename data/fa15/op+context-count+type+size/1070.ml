
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
(6,8)-(6,13)
(6,8)-(6,51)
(8,5)-(10,12)
(9,10)-(9,15)
(9,10)-(9,53)
(10,10)-(10,12)
(12,20)-(12,52)
(12,24)-(12,32)
(12,24)-(12,52)
(12,33)-(12,52)
(14,12)-(20,33)
(15,3)-(20,33)
(16,5)-(19,52)
(16,17)-(16,25)
(16,17)-(16,45)
(16,26)-(16,45)
(17,5)-(19,52)
(17,16)-(17,24)
(17,16)-(17,44)
(17,25)-(17,44)
(18,5)-(19,52)
(18,16)-(18,24)
(18,16)-(18,44)
(18,25)-(18,44)
(19,5)-(19,52)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,36)-(19,40)
(19,41)-(19,45)
(19,49)-(19,52)
(20,3)-(20,13)
(20,3)-(20,33)
(20,15)-(20,18)
(20,15)-(20,33)
(20,20)-(20,27)
(20,20)-(20,33)
(20,28)-(20,30)
(20,31)-(20,33)
*)

(* type error slice
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(4,4)-(10,14)
(4,13)-(10,12)
(4,16)-(10,12)
(5,3)-(10,12)
(6,8)-(6,13)
(6,8)-(6,51)
(15,3)-(20,33)
(15,12)-(19,52)
(20,15)-(20,18)
(20,15)-(20,33)
(20,20)-(20,27)
(20,20)-(20,33)
*)
