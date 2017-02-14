
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
    let args = failwith List.combine l1 l2 in
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
(14,16)-(14,59)
(14,40)-(14,59)
(14,41)-(14,42)
(14,44)-(14,58)
(14,45)-(14,46)
(14,49)-(14,50)
(14,56)-(14,58)
(15,4)-(17,51)
(15,15)-(15,17)
(16,4)-(17,51)
(16,15)-(16,23)
(16,15)-(16,42)
(16,24)-(16,36)
(16,37)-(16,39)
(16,40)-(16,42)
(17,4)-(17,51)
(17,18)-(17,32)
(17,18)-(17,44)
(17,33)-(17,34)
(17,35)-(17,39)
(17,40)-(17,44)
(17,48)-(17,51)
(18,2)-(18,12)
(18,2)-(18,34)
(18,14)-(18,17)
(18,19)-(18,26)
(18,27)-(18,29)
(18,30)-(18,32)
*)

(* type error slice
(14,4)-(17,51)
(14,10)-(14,59)
(14,12)-(14,59)
(14,16)-(14,59)
(14,40)-(14,59)
(14,40)-(14,59)
(14,41)-(14,42)
(16,15)-(16,23)
(16,15)-(16,42)
(16,24)-(16,36)
(17,18)-(17,32)
(17,18)-(17,44)
(17,33)-(17,34)
*)
