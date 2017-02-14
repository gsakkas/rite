
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
(31,5)-(31,67)
(31,42)-(31,67)
(31,49)-(31,50)
(32,3)-(33,76)
(33,3)-(33,76)
(33,29)-(33,76)
*)

(* type error slice
(4,4)-(7,73)
(4,13)-(7,69)
(7,6)-(7,35)
(7,31)-(7,32)
(7,33)-(7,35)
(12,4)-(20,37)
(12,12)-(20,33)
(20,20)-(20,27)
(20,20)-(20,33)
(20,28)-(20,30)
(22,4)-(27,74)
(22,20)-(27,72)
(24,21)-(24,26)
(24,25)-(24,26)
(31,17)-(31,27)
(31,17)-(31,32)
(31,28)-(31,29)
(31,42)-(31,48)
(31,42)-(31,56)
(31,49)-(31,50)
*)
