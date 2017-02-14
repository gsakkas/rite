
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
(4,20)-(5,70)
(5,3)-(5,70)
(5,9)-(5,10)
(5,24)-(5,26)
(5,37)-(5,70)
(5,40)-(5,41)
(5,40)-(5,45)
(5,44)-(5,45)
(5,51)-(5,61)
(5,51)-(5,63)
(5,62)-(5,63)
(5,69)-(5,70)
(7,20)-(16,20)
(8,3)-(16,20)
(8,12)-(15,52)
(9,5)-(15,52)
(10,7)-(11,75)
(11,7)-(11,75)
(12,5)-(15,52)
(13,5)-(15,52)
(15,5)-(15,52)
(16,3)-(16,20)
*)

(* type error slice
(8,3)-(16,20)
(8,12)-(15,52)
(14,59)-(14,70)
(14,59)-(14,72)
(14,71)-(14,72)
(16,15)-(16,18)
(16,15)-(16,20)
(16,19)-(16,20)
*)
