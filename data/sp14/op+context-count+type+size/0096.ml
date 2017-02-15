
let bigMul l1 l2 =
  let f a x = x in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x = match x with | (k,v) -> ([k], v) in
  let base = ([], [0]) in
  let args =
    let rec helper acc l1 l2 =
      match l1 with
      | [] -> acc
      | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2 in
    helper [] (List.rev l1) l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(3,14)-(3,15)
(4,2)-(11,49)
*)

(* type error slice
(3,2)-(11,49)
(3,8)-(3,15)
(3,10)-(3,15)
(3,14)-(3,15)
(4,2)-(11,49)
(4,13)-(4,22)
(4,14)-(4,16)
(5,2)-(11,49)
(6,4)-(10,30)
(7,6)-(9,74)
(7,6)-(9,74)
(7,6)-(9,74)
(7,6)-(9,74)
(8,14)-(8,17)
(9,16)-(9,22)
(9,16)-(9,74)
(9,23)-(9,39)
(9,23)-(9,39)
(9,24)-(9,31)
(9,25)-(9,26)
(9,35)-(9,38)
(9,40)-(9,71)
(9,41)-(9,49)
(9,50)-(9,68)
(9,61)-(9,62)
(9,61)-(9,67)
(9,69)-(9,70)
(10,4)-(10,10)
(10,4)-(10,30)
(11,16)-(11,30)
(11,16)-(11,42)
(11,31)-(11,32)
(11,33)-(11,37)
(11,38)-(11,42)
*)
