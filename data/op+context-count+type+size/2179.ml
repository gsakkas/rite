
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    match i with
    | 0 -> []
    | _ ->
        let (i,j) = x in
        let (s,t) = a in
        ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args = List.combine (List.rev (0 :: l)) (clone i ((List.length l) + 1)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    match i with
    | 0 -> (0, [])
    | _ ->
        let (i,j) = x in
        let (s,t) = a in
        ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args = List.combine (List.rev (0 :: l)) (clone i ((List.length l) + 1)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(7,12)-(7,14)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(5,3)-(14,50)
(5,9)-(11,60)
(5,11)-(11,60)
(6,5)-(11,60)
(6,11)-(6,12)
(7,12)-(7,14)
(9,9)-(11,60)
(9,21)-(9,22)
(10,9)-(11,60)
(10,21)-(10,22)
(11,13)-(11,29)
(11,13)-(11,60)
(11,36)-(11,60)
(12,3)-(14,50)
(12,15)-(12,16)
(12,15)-(12,20)
(12,18)-(12,20)
(13,3)-(14,50)
(13,14)-(13,26)
(13,14)-(13,76)
(13,28)-(13,36)
(13,28)-(13,44)
(13,38)-(13,44)
(13,48)-(13,53)
(13,48)-(13,76)
(13,54)-(13,55)
(13,58)-(13,76)
(14,17)-(14,31)
(14,17)-(14,43)
(14,32)-(14,33)
(14,34)-(14,38)
(14,39)-(14,43)
*)
