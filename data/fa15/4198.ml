
let padZero l1 l2 = (List.length l1) - (List.length l2);;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | n -> if n < 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) - (List.length l2) with
  | 0 -> (l1, l2)
  | n ->
      if n < 0
      then (((clone 0 (n * (-1))) @ l1), l2)
      else (((clone 0 n) @ l2), l1);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (fst,sec) = x in
      let (fst',sec') =
        if (fst + sec) > 9 then (((fst + sec) - 10), 1) else ((fst + sec), 0) in
      let (carry,digits) = a in
      let (carry',digits') =
        if sec' = 1 then (1, (digits @ [fst'])) else (0, (digits @ [fst'])) in
      (carry', digits') in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(2,12)-(2,55)
(2,20)-(2,55)
(4,19)-(4,51)
(4,23)-(4,31)
(4,23)-(4,51)
(4,32)-(4,51)
(6,11)-(12,34)
(8,16)-(8,24)
(8,16)-(8,44)
(8,25)-(8,44)
(9,4)-(11,51)
(9,15)-(9,23)
(9,15)-(9,43)
(9,24)-(9,43)
(10,4)-(11,51)
(10,15)-(10,23)
(10,15)-(10,43)
(10,24)-(10,43)
(11,4)-(11,51)
*)

(* type error slice
(2,3)-(2,57)
(2,12)-(2,55)
(2,15)-(2,55)
(2,20)-(2,55)
(7,2)-(12,34)
(7,11)-(11,51)
(12,13)-(12,34)
(12,14)-(12,17)
(12,18)-(12,33)
(12,19)-(12,26)
*)

(* all spans
(2,12)-(2,55)
(2,15)-(2,55)
(2,20)-(2,55)
(2,20)-(2,36)
(2,21)-(2,32)
(2,33)-(2,35)
(2,39)-(2,55)
(2,40)-(2,51)
(2,52)-(2,54)
(4,19)-(4,51)
(4,23)-(4,51)
(4,23)-(4,31)
(4,32)-(4,51)
(6,11)-(12,34)
(6,14)-(12,34)
(7,2)-(12,34)
(7,11)-(11,51)
(8,4)-(11,51)
(8,10)-(8,44)
(8,12)-(8,44)
(8,16)-(8,44)
(8,16)-(8,24)
(8,25)-(8,44)
(9,4)-(11,51)
(9,15)-(9,43)
(9,15)-(9,23)
(9,24)-(9,43)
(10,4)-(11,51)
(10,15)-(10,43)
(10,15)-(10,23)
(10,24)-(10,43)
(11,4)-(11,51)
(11,18)-(11,44)
(11,18)-(11,32)
(11,33)-(11,34)
(11,35)-(11,39)
(11,40)-(11,44)
(11,48)-(11,51)
(12,2)-(12,34)
(12,2)-(12,12)
(12,13)-(12,34)
(12,14)-(12,17)
(12,18)-(12,33)
(12,19)-(12,26)
(12,27)-(12,29)
(12,30)-(12,32)
*)
