
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let mul (i1,l1) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args =
      List.combine (List.rev (0 :: l1)) (List.rev (clone (List.length l) i)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let l1 = [9; 9; 9];;

let rec mulByDigit i l =
  let f a x =
    let (i,j) = x in
    let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev (0 :: l1)) (List.rev (clone (List.length l) i)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(4,19)-(5,69)
(5,2)-(5,69)
(5,8)-(5,9)
(5,23)-(5,25)
(5,36)-(5,69)
(5,39)-(5,40)
(5,39)-(5,44)
(5,43)-(5,44)
(5,50)-(5,60)
(5,50)-(5,62)
(5,61)-(5,62)
(5,68)-(5,69)
(7,19)-(16,20)
(8,2)-(16,20)
(8,11)-(15,51)
(9,4)-(15,51)
(10,6)-(11,76)
(11,6)-(11,76)
(12,4)-(15,51)
(13,4)-(15,51)
(15,4)-(15,51)
(15,18)-(15,32)
(16,2)-(16,20)
*)

(* type error slice
(8,2)-(16,20)
(8,11)-(15,51)
(14,57)-(14,72)
(14,58)-(14,69)
(14,70)-(14,71)
(16,13)-(16,20)
(16,14)-(16,17)
(16,18)-(16,19)
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
(4,19)-(5,69)
(5,2)-(5,69)
(5,8)-(5,9)
(5,23)-(5,25)
(5,36)-(5,69)
(5,39)-(5,44)
(5,39)-(5,40)
(5,43)-(5,44)
(5,50)-(5,62)
(5,50)-(5,60)
(5,61)-(5,62)
(5,68)-(5,69)
(7,19)-(16,20)
(7,21)-(16,20)
(8,2)-(16,20)
(8,11)-(15,51)
(9,4)-(15,51)
(9,10)-(11,76)
(9,12)-(11,76)
(10,6)-(11,76)
(10,18)-(10,19)
(11,6)-(11,76)
(11,18)-(11,19)
(11,23)-(11,76)
(11,24)-(11,44)
(11,25)-(11,38)
(11,26)-(11,33)
(11,27)-(11,28)
(11,31)-(11,32)
(11,36)-(11,37)
(11,41)-(11,43)
(11,46)-(11,75)
(11,47)-(11,69)
(11,48)-(11,61)
(11,49)-(11,56)
(11,50)-(11,51)
(11,54)-(11,55)
(11,59)-(11,60)
(11,66)-(11,68)
(11,73)-(11,74)
(12,4)-(15,51)
(12,15)-(12,22)
(12,16)-(12,17)
(12,19)-(12,21)
(13,4)-(15,51)
(14,6)-(14,76)
(14,6)-(14,18)
(14,19)-(14,39)
(14,20)-(14,28)
(14,29)-(14,38)
(14,30)-(14,31)
(14,35)-(14,37)
(14,40)-(14,76)
(14,41)-(14,49)
(14,50)-(14,75)
(14,51)-(14,56)
(14,57)-(14,72)
(14,58)-(14,69)
(14,70)-(14,71)
(14,73)-(14,74)
(15,4)-(15,51)
(15,18)-(15,44)
(15,18)-(15,32)
(15,33)-(15,34)
(15,35)-(15,39)
(15,40)-(15,44)
(15,48)-(15,51)
(16,2)-(16,20)
(16,2)-(16,12)
(16,13)-(16,20)
(16,14)-(16,17)
(16,18)-(16,19)
*)