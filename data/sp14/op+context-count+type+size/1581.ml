
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,rh::rt) ->
          (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
      | _ -> ([], []) in
    let base = ((List.rev l1), [0]) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i mod 2 with
  | 0 ->
      (match i with
       | 0 -> []
       | 2 -> bigAdd l l
       | _ -> bigAdd (mulByDigit (i / 2) l) (mulByDigit (i / 2) l))
  | _ -> (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (h1::t1,rh::rt) -> (t1, ((bigAdd (mulByDigit x rh) rt) :: rt)) in
  let base = ((List.rev l1), [1]) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,rh::rt) ->
          (t1, ((((h1 + x) + rh) / 10) :: (((h1 + x) + rh) mod 10) :: rt))
      | _ -> ([], []) in
    let base = ((List.rev l1), [0]) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i mod 2 with
  | 0 ->
      (match i with
       | 0 -> []
       | 2 -> bigAdd l l
       | _ -> bigAdd (mulByDigit (i / 2) l) (mulByDigit (i / 2) l))
  | _ -> (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (h1::t1,r) -> (t1, (bigAdd (mulByDigit h1 (List.append r [0])) r)) in
  let base = (l1, []) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(43,5)-(44,67)
(44,33)-(44,67)
(44,52)-(44,53)
(44,54)-(44,56)
(44,58)-(44,60)
(44,65)-(44,67)
(45,3)-(46,76)
(45,16)-(45,24)
(45,16)-(45,27)
(45,30)-(45,33)
(45,31)-(45,32)
(46,14)-(46,22)
(46,14)-(46,25)
(46,29)-(46,76)
*)

(* type error slice
(19,14)-(19,60)
(19,14)-(19,60)
(19,34)-(19,44)
(19,34)-(19,46)
(19,54)-(19,60)
(21,4)-(30,37)
(21,12)-(30,33)
(21,15)-(30,33)
(22,3)-(30,33)
(30,3)-(30,13)
(30,3)-(30,33)
(37,15)-(37,21)
(37,15)-(37,25)
(37,22)-(37,23)
(38,15)-(38,21)
(38,15)-(38,66)
(38,23)-(38,33)
(38,23)-(38,43)
(38,42)-(38,43)
(38,46)-(38,56)
(38,46)-(38,66)
(42,3)-(46,76)
(42,9)-(44,67)
(43,5)-(44,67)
(43,5)-(44,67)
(43,5)-(44,67)
(43,11)-(43,12)
(44,33)-(44,39)
(44,33)-(44,60)
(44,33)-(44,67)
(44,33)-(44,67)
(44,41)-(44,51)
(44,41)-(44,56)
(44,54)-(44,56)
(44,58)-(44,60)
(44,65)-(44,67)
(45,3)-(46,76)
(45,16)-(45,33)
(45,30)-(45,33)
(45,30)-(45,33)
(45,31)-(45,32)
(46,43)-(46,57)
(46,43)-(46,69)
(46,58)-(46,59)
(46,60)-(46,64)
*)
