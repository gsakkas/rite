
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (x mod 10) :: a in
    let base = (match l1 with | h -> h) + (match l2 with | h -> h) in
    let args = [] in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 < s2
  then (((clone 0 (s2 - s1)) @ l1), l2)
  else if s2 < s1 then (l1, ((clone 0 (s1 - s2)) @ l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h != 0 then h :: t else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match snd a with
      | [] ->
          (((fst x) + (snd x)),
            [((fst x) + (snd x)) / 10; ((fst x) + (snd x)) mod 10])
      | h::t -> (0, []) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,18)-(16,19)
(16,18)-(16,26)
(16,18)-(16,32)
(16,24)-(16,26)
(16,31)-(16,32)
(17,5)-(18,69)
(17,17)-(17,39)
(17,23)-(17,25)
(17,38)-(17,39)
(17,44)-(17,66)
(17,50)-(17,52)
(17,65)-(17,66)
(18,5)-(18,69)
(18,16)-(18,18)
(18,22)-(18,69)
(18,36)-(18,50)
(18,36)-(18,62)
(18,51)-(18,52)
(18,53)-(18,57)
(18,58)-(18,62)
(18,66)-(18,69)
(19,3)-(19,13)
(19,15)-(19,18)
(19,15)-(19,33)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(9,72)
(4,13)-(9,69)
(4,16)-(9,69)
(5,3)-(9,69)
(5,12)-(5,23)
(5,12)-(5,26)
(5,24)-(5,26)
(6,3)-(9,69)
(6,12)-(6,23)
(6,12)-(6,26)
(6,24)-(6,26)
(7,3)-(9,69)
(8,11)-(8,16)
(8,11)-(8,27)
(8,11)-(8,34)
(8,11)-(8,39)
(8,17)-(8,18)
(8,20)-(8,27)
(8,30)-(8,31)
(8,32)-(8,34)
(8,37)-(8,39)
(15,3)-(19,33)
(15,12)-(18,69)
(16,5)-(18,69)
(16,11)-(16,32)
(16,13)-(16,32)
(16,18)-(16,19)
(16,18)-(16,26)
(16,18)-(16,32)
(16,31)-(16,32)
(17,5)-(18,69)
(17,17)-(17,39)
(17,17)-(17,66)
(17,23)-(17,25)
(17,44)-(17,66)
(17,50)-(17,52)
(18,5)-(18,69)
(18,16)-(18,18)
(18,22)-(18,69)
(18,36)-(18,50)
(18,36)-(18,62)
(18,51)-(18,52)
(18,53)-(18,57)
(18,58)-(18,62)
(18,66)-(18,69)
(19,15)-(19,18)
(19,15)-(19,33)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
*)
