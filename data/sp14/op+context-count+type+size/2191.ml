
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
(7,11)-(7,13)
*)

(* type error slice
(5,2)-(14,49)
(5,8)-(11,61)
(5,10)-(11,61)
(6,4)-(11,61)
(6,4)-(11,61)
(7,11)-(7,13)
(9,8)-(11,61)
(10,8)-(11,61)
(10,8)-(11,61)
(10,20)-(10,21)
(11,8)-(11,61)
(14,16)-(14,30)
(14,16)-(14,42)
(14,31)-(14,32)
*)
