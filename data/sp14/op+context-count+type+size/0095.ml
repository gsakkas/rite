
let bigMul l1 l2 =
  let f a x = ([0], [x]) in
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
(3,14)-(3,24)
(3,16)-(3,17)
(3,20)-(3,23)
(3,21)-(3,22)
(4,2)-(11,49)
*)

(* type error slice
(3,2)-(11,49)
(3,8)-(3,24)
(3,10)-(3,24)
(3,14)-(3,24)
(3,20)-(3,23)
(3,20)-(3,23)
(3,21)-(3,22)
(4,2)-(11,49)
(4,13)-(4,22)
(4,18)-(4,21)
(4,18)-(4,21)
(4,19)-(4,20)
(5,2)-(11,49)
(6,4)-(10,30)
(7,6)-(9,74)
(7,6)-(9,74)
(8,14)-(8,17)
(9,16)-(9,22)
(9,16)-(9,74)
(9,23)-(9,39)
(9,23)-(9,39)
(9,24)-(9,31)
(9,35)-(9,38)
(10,4)-(10,10)
(10,4)-(10,30)
(11,16)-(11,30)
(11,16)-(11,42)
(11,31)-(11,32)
(11,33)-(11,37)
(11,38)-(11,42)
*)
