
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
(14,15)-(14,30)
(0 , mulByDigit x l1)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(3,3)-(3,70)
(3,9)-(3,10)
(3,37)-(3,70)
(3,51)-(3,61)
(3,51)-(3,63)
(3,69)-(3,70)
(5,4)-(11,31)
(5,20)-(11,29)
(5,22)-(11,29)
(6,3)-(11,29)
(11,3)-(11,13)
(11,3)-(11,29)
(14,3)-(16,67)
(14,9)-(14,30)
(14,11)-(14,30)
(14,15)-(14,25)
(14,15)-(14,30)
(15,3)-(16,67)
(15,14)-(15,21)
(16,34)-(16,48)
(16,34)-(16,60)
(16,49)-(16,50)
(16,51)-(16,55)
*)
