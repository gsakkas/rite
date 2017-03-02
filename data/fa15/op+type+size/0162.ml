
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (num1,num2) = x in ((a * 10) + num1) + num2 in
    let base = (0, 0) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  (((clone 0 ((List.length l2) - (List.length l1))) @ l1),
    ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (num1,num2) = x in
      let (carry,sum) = a in
      ((((num1 + num2) + carry) / 10), ((((num1 + num2) + carry) mod 10) ::
        sum)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(13,16)-(13,63)
(13,39)-(13,63)
(13,40)-(13,48)
(13,41)-(13,42)
(13,45)-(13,47)
(13,51)-(13,55)
(14,4)-(16,51)
(14,15)-(14,21)
(14,19)-(14,20)
(15,4)-(16,51)
(15,15)-(15,33)
(16,4)-(16,51)
*)

(* type error slice
(13,4)-(16,51)
(13,10)-(13,63)
(13,40)-(13,48)
(13,41)-(13,42)
(14,4)-(16,51)
(14,15)-(14,21)
(16,18)-(16,32)
(16,18)-(16,44)
(16,33)-(16,34)
(16,35)-(16,39)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(6,59)
(4,15)-(6,59)
(5,2)-(6,59)
(5,3)-(5,57)
(5,52)-(5,53)
(5,4)-(5,51)
(5,5)-(5,10)
(5,11)-(5,12)
(5,13)-(5,50)
(5,14)-(5,30)
(5,15)-(5,26)
(5,27)-(5,29)
(5,33)-(5,49)
(5,34)-(5,45)
(5,46)-(5,48)
(5,54)-(5,56)
(6,4)-(6,58)
(6,53)-(6,54)
(6,5)-(6,52)
(6,6)-(6,11)
(6,12)-(6,13)
(6,14)-(6,51)
(6,15)-(6,31)
(6,16)-(6,27)
(6,28)-(6,30)
(6,34)-(6,50)
(6,35)-(6,46)
(6,47)-(6,49)
(6,55)-(6,57)
(8,19)-(9,74)
(9,2)-(9,74)
(9,8)-(9,9)
(9,23)-(9,25)
(9,36)-(9,74)
(9,39)-(9,44)
(9,39)-(9,40)
(9,43)-(9,44)
(9,50)-(9,62)
(9,50)-(9,60)
(9,61)-(9,62)
(9,68)-(9,74)
(9,68)-(9,69)
(9,73)-(9,74)
(11,11)-(17,34)
(11,14)-(17,34)
(12,2)-(17,34)
(12,11)-(16,51)
(13,4)-(16,51)
(13,10)-(13,63)
(13,12)-(13,63)
(13,16)-(13,63)
(13,34)-(13,35)
(13,39)-(13,63)
(13,39)-(13,56)
(13,40)-(13,48)
(13,41)-(13,42)
(13,45)-(13,47)
(13,51)-(13,55)
(13,59)-(13,63)
(14,4)-(16,51)
(14,15)-(14,21)
(14,16)-(14,17)
(14,19)-(14,20)
(15,4)-(16,51)
(15,15)-(15,33)
(15,15)-(15,27)
(15,28)-(15,30)
(15,31)-(15,33)
(16,4)-(16,51)
(16,18)-(16,44)
(16,18)-(16,32)
(16,33)-(16,34)
(16,35)-(16,39)
(16,40)-(16,44)
(16,48)-(16,51)
(17,2)-(17,34)
(17,2)-(17,12)
(17,13)-(17,34)
(17,14)-(17,17)
(17,18)-(17,33)
(17,19)-(17,26)
(17,27)-(17,29)
(17,30)-(17,32)
*)
