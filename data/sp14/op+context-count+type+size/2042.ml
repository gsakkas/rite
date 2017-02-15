
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
    let value = mulByDigit x l1 in (0, ((bigAdd value x) :: (snd a))) in
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
(31,4)-(31,69)
(31,39)-(31,68)
(31,54)-(31,55)
(32,2)-(33,75)
(33,2)-(33,75)
(33,28)-(33,75)
*)

(* type error slice
(4,3)-(7,72)
(4,12)-(7,70)
(4,15)-(7,70)
(7,37)-(7,69)
(7,64)-(7,65)
(7,66)-(7,68)
(12,3)-(20,36)
(12,11)-(20,34)
(12,14)-(20,34)
(20,18)-(20,33)
(20,19)-(20,26)
(20,30)-(20,32)
(22,3)-(27,73)
(22,19)-(27,71)
(24,19)-(24,26)
(24,24)-(24,25)
(31,16)-(31,26)
(31,16)-(31,31)
(31,27)-(31,28)
(31,40)-(31,56)
(31,41)-(31,47)
(31,54)-(31,55)
*)
