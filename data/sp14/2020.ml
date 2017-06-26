
let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | [] -> (mulByDigit x l2) :: a
    | h::t -> [(mulByDigit x l2) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with | [] -> mulByDigit x l2 | _ -> bigAdd a (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(2,19)-(3,57)
(5,19)-(11,73)
(15,4)-(17,58)
(16,12)-(16,34)
(16,33)-(16,34)
(17,14)-(17,54)
(17,15)-(17,32)
(17,15)-(17,43)
(17,35)-(17,43)
(17,36)-(17,37)
(17,40)-(17,42)
(17,45)-(17,46)
(17,45)-(17,53)
(17,51)-(17,53)
(17,55)-(17,56)
(17,57)-(17,58)
(19,28)-(19,75)
*)

(* type error slice
(3,2)-(3,57)
(3,8)-(3,9)
(3,36)-(3,46)
(3,36)-(3,48)
(3,56)-(3,57)
(5,3)-(11,75)
(5,19)-(11,73)
(5,21)-(11,73)
(6,2)-(11,73)
(10,2)-(11,73)
(11,2)-(11,73)
(11,34)-(11,44)
(11,34)-(11,73)
(14,2)-(19,75)
(14,8)-(17,58)
(15,4)-(17,58)
(15,10)-(15,11)
(16,12)-(16,29)
(16,12)-(16,34)
(16,13)-(16,23)
(16,33)-(16,34)
(17,14)-(17,54)
(17,14)-(17,58)
(17,15)-(17,32)
(17,15)-(17,43)
(17,16)-(17,26)
(17,35)-(17,43)
(17,36)-(17,37)
(17,55)-(17,56)
(19,28)-(19,75)
(19,42)-(19,56)
(19,42)-(19,68)
(19,57)-(19,58)
*)

(* all spans
(2,19)-(3,57)
(3,2)-(3,57)
(3,8)-(3,9)
(3,23)-(3,25)
(3,36)-(3,48)
(3,36)-(3,46)
(3,47)-(3,48)
(3,56)-(3,57)
(5,19)-(11,73)
(5,21)-(11,73)
(6,2)-(11,73)
(6,8)-(9,48)
(6,10)-(9,48)
(7,4)-(9,48)
(7,10)-(7,11)
(8,12)-(8,24)
(8,12)-(8,19)
(8,13)-(8,14)
(8,17)-(8,18)
(8,23)-(8,24)
(9,14)-(9,48)
(9,45)-(9,46)
(9,14)-(9,44)
(9,15)-(9,33)
(9,15)-(9,22)
(9,16)-(9,17)
(9,20)-(9,21)
(9,25)-(9,33)
(9,26)-(9,27)
(9,30)-(9,32)
(9,35)-(9,43)
(9,35)-(9,36)
(9,41)-(9,43)
(9,47)-(9,48)
(10,2)-(11,73)
(10,13)-(10,15)
(11,2)-(11,73)
(11,13)-(11,30)
(11,13)-(11,21)
(11,22)-(11,30)
(11,23)-(11,24)
(11,28)-(11,29)
(11,34)-(11,73)
(11,34)-(11,44)
(11,45)-(11,73)
(11,46)-(11,60)
(11,61)-(11,62)
(11,63)-(11,67)
(11,68)-(11,72)
(13,11)-(19,75)
(13,14)-(19,75)
(14,2)-(19,75)
(14,8)-(17,58)
(14,10)-(17,58)
(15,4)-(17,58)
(15,10)-(15,11)
(16,12)-(16,34)
(16,12)-(16,29)
(16,13)-(16,23)
(16,24)-(16,25)
(16,26)-(16,28)
(16,33)-(16,34)
(17,14)-(17,58)
(17,55)-(17,56)
(17,14)-(17,54)
(17,15)-(17,43)
(17,15)-(17,32)
(17,16)-(17,26)
(17,27)-(17,28)
(17,29)-(17,31)
(17,35)-(17,43)
(17,36)-(17,37)
(17,40)-(17,42)
(17,45)-(17,53)
(17,45)-(17,46)
(17,51)-(17,53)
(17,57)-(17,58)
(18,2)-(19,75)
(18,13)-(18,15)
(19,2)-(19,75)
(19,13)-(19,24)
(19,13)-(19,21)
(19,22)-(19,24)
(19,28)-(19,75)
(19,42)-(19,68)
(19,42)-(19,56)
(19,57)-(19,58)
(19,59)-(19,63)
(19,64)-(19,68)
(19,72)-(19,75)
*)
