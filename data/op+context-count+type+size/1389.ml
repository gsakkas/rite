
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x,y) -> [a; (x + y) mod 10] in
    let base = [] in
    let args = failwith List.combine (l1 l2) in
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
(14,17)-(14,60)
(14,41)-(14,60)
(14,42)-(14,43)
(14,46)-(14,47)
(14,46)-(14,59)
(14,50)-(14,51)
(14,57)-(14,59)
(15,5)-(17,52)
(16,16)-(16,24)
(16,16)-(16,44)
(16,25)-(16,37)
(16,39)-(16,41)
(16,42)-(16,44)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,36)-(17,40)
(17,41)-(17,45)
(17,49)-(17,52)
(18,3)-(18,13)
(18,15)-(18,18)
(18,15)-(18,33)
(18,20)-(18,27)
(18,20)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(7,70)
(4,13)-(7,66)
(4,16)-(7,66)
(5,3)-(7,66)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(6,11)-(6,16)
(6,11)-(6,54)
(6,11)-(6,62)
(6,11)-(6,67)
(6,17)-(6,18)
(6,21)-(6,54)
(6,58)-(6,59)
(6,60)-(6,62)
(6,65)-(6,67)
(13,3)-(18,33)
(13,12)-(17,52)
(14,5)-(17,52)
(14,11)-(14,60)
(14,13)-(14,60)
(14,17)-(14,60)
(14,23)-(14,24)
(14,41)-(14,60)
(14,42)-(14,43)
(14,46)-(14,47)
(14,46)-(14,51)
(14,46)-(14,59)
(14,50)-(14,51)
(15,5)-(17,52)
(15,16)-(15,18)
(16,5)-(17,52)
(16,16)-(16,24)
(16,16)-(16,44)
(16,25)-(16,37)
(16,39)-(16,41)
(16,39)-(16,44)
(16,42)-(16,44)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,36)-(17,40)
(17,41)-(17,45)
(17,49)-(17,52)
(18,15)-(18,18)
(18,15)-(18,33)
(18,20)-(18,27)
(18,20)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
*)
