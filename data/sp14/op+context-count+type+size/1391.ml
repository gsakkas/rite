
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
(6,9)-(6,60)
(7,9)-(7,60)
(9,24)-(9,32)
(9,24)-(9,52)
(9,33)-(9,52)
(11,12)-(17,33)
(12,3)-(17,33)
(13,5)-(16,52)
(13,17)-(13,25)
(13,17)-(13,45)
(13,26)-(13,45)
(14,5)-(16,52)
(14,16)-(14,24)
(14,16)-(14,44)
(14,25)-(14,44)
(15,5)-(16,52)
(15,16)-(15,24)
(15,16)-(15,44)
(15,25)-(15,44)
(16,5)-(16,52)
(16,19)-(16,33)
(16,19)-(16,45)
(16,34)-(16,35)
(16,36)-(16,40)
(16,41)-(16,45)
(16,49)-(16,52)
(17,3)-(17,13)
(17,3)-(17,33)
(17,15)-(17,18)
(17,15)-(17,33)
(17,20)-(17,27)
(17,20)-(17,33)
(17,28)-(17,30)
(17,31)-(17,33)
*)

(* type error slice
(4,4)-(7,62)
(4,13)-(7,60)
(4,16)-(7,60)
(5,3)-(7,60)
(6,9)-(6,60)
(6,56)-(6,57)
(12,3)-(17,33)
(12,12)-(16,52)
(17,15)-(17,18)
(17,15)-(17,33)
(17,20)-(17,27)
(17,20)-(17,33)
*)
