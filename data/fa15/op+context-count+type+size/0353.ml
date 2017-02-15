
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let rec helper acc cin l' =
    match l' with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) t in
  removeZero (helper [] 0 l);;

let bigMul l1 l2 =
  let f a x = mulByDigit x l1 in
  let base = (0, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let rec helper acc cin l' =
    match l' with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) t in
  removeZero (helper [] 0 l);;

let bigMul l1 l2 =
  let f a x = (0, (mulByDigit x l1)) in
  let base = (0, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(14,14)-(14,29)
*)

(* type error slice
(3,2)-(3,69)
(3,2)-(3,69)
(3,8)-(3,9)
(3,36)-(3,69)
(3,36)-(3,69)
(3,50)-(3,60)
(3,50)-(3,62)
(3,68)-(3,69)
(5,3)-(11,30)
(5,19)-(11,28)
(5,21)-(11,28)
(6,2)-(11,28)
(11,2)-(11,12)
(11,2)-(11,28)
(14,2)-(16,66)
(14,8)-(14,29)
(14,10)-(14,29)
(14,14)-(14,24)
(14,14)-(14,29)
(15,2)-(16,66)
(15,13)-(15,20)
(16,33)-(16,47)
(16,33)-(16,59)
(16,48)-(16,49)
(16,50)-(16,54)
*)
