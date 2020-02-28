
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
    match a with
    | [] -> mulByDigit x l2
    | _ -> bigAdd List.rev (0 :: (List.rev a)) (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;


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
    match a with
    | [] -> mulByDigit x l2
    | _ -> bigAdd (List.rev (0 :: (List.rev a))) (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(40,12)-(40,65)
bigAdd (List.rev (0 :: (List.rev a)))
       (mulByDigit x l2)
AppG [AppG [EmptyG],AppG [EmptyG,EmptyG]]

*)

(* type error slice
(15,3)-(15,58)
(15,9)-(15,10)
(15,37)-(15,47)
(15,37)-(15,49)
(15,57)-(15,58)
(17,4)-(26,37)
(17,12)-(26,35)
(17,15)-(26,35)
(18,3)-(26,35)
(26,3)-(26,13)
(26,3)-(26,35)
(40,12)-(40,18)
(40,12)-(40,65)
*)
