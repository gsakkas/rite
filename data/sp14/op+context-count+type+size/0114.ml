
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
(3,16)-(3,24)
(3,17)-(3,18)
(3,21)-(3,24)
(3,22)-(3,23)
(4,3)-(11,50)
*)

(* type error slice
(3,3)-(11,50)
(3,9)-(3,24)
(3,11)-(3,24)
(3,16)-(3,24)
(3,21)-(3,24)
(3,21)-(3,24)
(3,22)-(3,23)
(4,3)-(11,50)
(4,15)-(4,22)
(4,19)-(4,22)
(4,19)-(4,22)
(4,20)-(4,21)
(5,3)-(11,50)
(6,5)-(10,31)
(7,7)-(9,75)
(7,7)-(9,75)
(8,15)-(8,18)
(9,17)-(9,23)
(9,17)-(9,75)
(9,26)-(9,31)
(9,26)-(9,39)
(9,26)-(9,39)
(9,36)-(9,39)
(10,5)-(10,11)
(10,5)-(10,31)
(11,17)-(11,31)
(11,17)-(11,43)
(11,32)-(11,33)
(11,34)-(11,38)
(11,39)-(11,43)
*)
