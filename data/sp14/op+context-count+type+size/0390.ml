
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (add1,add2) -> (add1 + add2) + a in
    let base = 0 in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               ((((add1 + add2) + carry) / 10),
                 ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,17)-(15,64)
(15,48)-(15,64)
(15,63)-(15,64)
(16,5)-(18,52)
(16,16)-(16,17)
(17,5)-(18,52)
(17,16)-(17,44)
(18,5)-(18,52)
(18,19)-(18,33)
(18,19)-(18,45)
(18,34)-(18,35)
(18,36)-(18,40)
(18,41)-(18,45)
(18,49)-(18,52)
(19,3)-(19,13)
(19,3)-(19,33)
(19,15)-(19,18)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
*)

(* type error slice
(15,5)-(18,52)
(15,11)-(15,64)
(15,48)-(15,64)
(15,63)-(15,64)
(18,5)-(18,52)
(18,19)-(18,33)
(18,19)-(18,45)
(18,34)-(18,35)
*)
