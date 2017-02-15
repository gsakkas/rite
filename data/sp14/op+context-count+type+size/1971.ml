
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
