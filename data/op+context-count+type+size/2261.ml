
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let digitSum = ((fst x) + (snd x)) + (fst a) in
      ((digitSum / 10), ((digitSum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f (0 :: l) base in removeZero result;;

let bigMul l1 l2 =
  let f a x =
    let value = mulByDigit x l1 in (0, ((bigAdd x value) :: (snd a))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let digitSum = ((fst x) + (snd x)) + (fst a) in
      ((digitSum / 10), ((digitSum mod 10) :: (snd a))) in
    let base = (0, []) in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f (0 :: l) base in removeZero result;;

let bigMul l1 l2 =
  let f a x = let value = mulByDigit x l1 in (0, (bigAdd value (snd a))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(18,27)-(18,28)
(18,30)-(18,31)
(31,42)-(31,67)
(31,49)-(31,50)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(7,73)
(4,13)-(7,69)
(4,16)-(7,69)
(5,3)-(7,69)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,3)-(7,69)
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(7,6)-(7,11)
(7,6)-(7,28)
(7,6)-(7,35)
(7,6)-(7,69)
(7,12)-(7,13)
(7,15)-(7,28)
(7,31)-(7,32)
(7,33)-(7,35)
(7,40)-(7,45)
(7,40)-(7,62)
(7,40)-(7,69)
(7,46)-(7,47)
(7,49)-(7,62)
(7,65)-(7,66)
(7,67)-(7,69)
(10,3)-(10,70)
(10,51)-(10,61)
(10,51)-(10,63)
(10,62)-(10,63)
(12,4)-(20,37)
(12,12)-(20,33)
(12,15)-(20,33)
(13,3)-(20,33)
(13,12)-(19,52)
(14,5)-(19,52)
(14,11)-(16,53)
(14,13)-(16,53)
(15,7)-(16,53)
(15,24)-(15,27)
(15,24)-(15,29)
(15,28)-(15,29)
(15,45)-(15,48)
(15,45)-(15,50)
(15,49)-(15,50)
(16,9)-(16,22)
(16,9)-(16,53)
(16,27)-(16,53)
(17,5)-(19,52)
(17,17)-(17,18)
(17,17)-(17,22)
(17,20)-(17,22)
(18,5)-(19,52)
(18,16)-(18,24)
(18,16)-(18,55)
(18,27)-(18,55)
(18,37)-(18,49)
(18,37)-(18,55)
(18,50)-(18,52)
(18,53)-(18,55)
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
(22,4)-(27,74)
(22,20)-(27,72)
(22,22)-(27,72)
(23,3)-(27,72)
(23,9)-(25,51)
(23,11)-(25,51)
(24,5)-(25,51)
(24,21)-(24,22)
(24,21)-(24,26)
(24,25)-(24,26)
(24,31)-(24,34)
(24,31)-(24,36)
(24,35)-(24,36)
(25,7)-(25,20)
(25,7)-(25,51)
(25,25)-(25,51)
(26,3)-(27,72)
(26,15)-(26,16)
(26,15)-(26,20)
(26,18)-(26,20)
(27,3)-(27,72)
(27,20)-(27,35)
(27,20)-(27,51)
(27,36)-(27,37)
(27,39)-(27,40)
(27,39)-(27,45)
(27,44)-(27,45)
(27,47)-(27,51)
(27,55)-(27,65)
(27,55)-(27,72)
(27,66)-(27,72)
(31,5)-(31,67)
(31,17)-(31,27)
(31,17)-(31,32)
(31,28)-(31,29)
(31,30)-(31,32)
(31,42)-(31,48)
(31,42)-(31,56)
(31,49)-(31,50)
(31,51)-(31,56)
*)
