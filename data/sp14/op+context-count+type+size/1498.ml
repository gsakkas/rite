
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with | [] -> mulByDigit x l2 | _ -> bigAdd a (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with | [] -> mulByDigit x l2 | _ -> bigAdd a (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(40,28)-(40,75)
*)

(* type error slice
(15,2)-(15,57)
(15,2)-(15,57)
(15,2)-(15,57)
(15,2)-(15,57)
(15,8)-(15,9)
(15,36)-(15,46)
(15,36)-(15,48)
(15,56)-(15,57)
(28,3)-(34,75)
(28,19)-(34,73)
(28,21)-(34,73)
(29,2)-(34,73)
(33,2)-(34,73)
(34,2)-(34,73)
(34,34)-(34,44)
(34,34)-(34,73)
(37,2)-(40,75)
(37,8)-(38,74)
(37,10)-(38,74)
(38,4)-(38,74)
(38,25)-(38,35)
(38,25)-(38,40)
(40,28)-(40,75)
(40,42)-(40,56)
(40,42)-(40,68)
(40,57)-(40,58)
*)
