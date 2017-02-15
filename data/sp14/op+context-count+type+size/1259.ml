
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | _ -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,7)-(6,59)
(7,7)-(7,59)
(9,23)-(9,31)
(9,23)-(9,51)
(9,32)-(9,51)
(11,11)-(17,34)
(12,2)-(17,34)
(13,4)-(16,51)
(13,16)-(13,24)
(13,16)-(13,44)
(13,25)-(13,44)
(14,4)-(16,51)
(14,15)-(14,23)
(14,15)-(14,43)
(14,24)-(14,43)
(15,4)-(16,51)
(15,15)-(15,23)
(15,15)-(15,43)
(15,24)-(15,43)
(16,4)-(16,51)
(16,18)-(16,32)
(16,18)-(16,44)
(16,33)-(16,34)
(16,35)-(16,39)
(16,40)-(16,44)
(16,48)-(16,51)
(17,2)-(17,12)
(17,2)-(17,34)
(17,13)-(17,34)
(17,14)-(17,17)
(17,18)-(17,33)
(17,19)-(17,26)
(17,27)-(17,29)
(17,30)-(17,32)
*)

(* type error slice
(4,3)-(7,61)
(4,12)-(7,59)
(4,15)-(7,59)
(5,2)-(7,59)
(6,7)-(6,59)
(6,55)-(6,56)
(12,2)-(17,34)
(12,11)-(16,51)
(17,13)-(17,34)
(17,14)-(17,17)
(17,18)-(17,33)
(17,19)-(17,26)
*)
