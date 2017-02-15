
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match x with | (x1,x2) -> (x1 + x2) :: a in
    let base = ([], []) in
    let args = List.combine padZero (l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,sum) = a in
      (((x1 + x2) / 10), ((((x1 + x2) + carry) mod 10) :: sum)) in
    let base = (0, []) in
    let args = let (l1',l2') = padZero l1 l2 in List.combine l1' l2' in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,16)-(16,56)
(16,42)-(16,51)
(16,42)-(16,56)
(16,43)-(16,45)
(16,55)-(16,56)
(17,4)-(19,51)
(17,15)-(17,23)
(17,16)-(17,18)
(18,4)-(19,51)
(18,15)-(18,27)
(18,15)-(18,43)
(18,36)-(18,43)
(19,4)-(19,51)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,12)
(20,2)-(20,34)
(20,13)-(20,34)
(20,14)-(20,17)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(4,3)-(9,45)
(4,12)-(9,43)
(4,15)-(9,43)
(5,2)-(9,43)
(6,2)-(9,43)
(7,2)-(9,43)
(8,7)-(8,43)
(8,8)-(8,10)
(9,8)-(9,38)
(9,33)-(9,34)
(9,35)-(9,37)
(15,2)-(20,34)
(15,11)-(19,51)
(16,4)-(19,51)
(16,10)-(16,56)
(16,42)-(16,56)
(16,55)-(16,56)
(17,4)-(19,51)
(17,15)-(17,23)
(18,15)-(18,27)
(18,15)-(18,43)
(18,28)-(18,35)
(18,36)-(18,43)
(18,37)-(18,39)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
*)
