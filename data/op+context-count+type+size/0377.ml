
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
      match x with | _ -> [a mod 10] | h::t -> ((a + h) mod 10) :: t in
    let base = [] in
    let args = List.combine l1 l2 in
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
      let carry = match a with | (x,y) -> x in
      match x with
      | (add1,add2) ->
          let new_carry = ((carry + add1) + add2) / 10 in
          let digit = ((carry + add1) + add2) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,7)-(16,69)
(16,13)-(16,14)
(16,27)-(16,37)
(16,28)-(16,29)
(16,28)-(16,36)
(16,34)-(16,36)
(16,50)-(16,51)
(16,50)-(16,69)
(16,54)-(16,55)
(16,61)-(16,63)
(16,68)-(16,69)
(17,5)-(19,52)
(17,16)-(17,18)
(18,16)-(18,28)
(18,16)-(18,34)
(18,29)-(18,31)
(18,32)-(18,34)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,36)-(19,40)
(19,41)-(19,45)
(19,49)-(19,52)
(20,3)-(20,13)
(20,15)-(20,18)
(20,15)-(20,33)
(20,20)-(20,27)
(20,20)-(20,33)
(20,28)-(20,30)
(20,31)-(20,33)
*)

(* type error slice
(15,5)-(19,52)
(15,11)-(16,69)
(15,13)-(16,69)
(16,7)-(16,69)
(16,13)-(16,14)
(16,27)-(16,37)
(16,28)-(16,29)
(16,28)-(16,36)
(17,5)-(19,52)
(17,16)-(17,18)
(18,5)-(19,52)
(18,16)-(18,28)
(18,16)-(18,34)
(18,29)-(18,31)
(18,32)-(18,34)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,36)-(19,40)
(19,41)-(19,45)
*)
