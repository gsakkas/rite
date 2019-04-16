
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
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,h1::t1) ->
          (match x with
           | h2::t2 ->
               ((((h1 + h2) + carry) / 10), (((h1 + h2) mod 10) :: t1))) in
    let base = (0, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) = [0; 0; 0; 0; 0] in removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,5)-(30,69)
[0 ; 0 ; 0 ; 0 ; 0]
ListG (fromList [LitG])

*)

(* type error slice
(3,31)-(3,32)
(3,31)-(3,53)
(3,36)-(3,53)
(3,37)-(3,42)
(3,43)-(3,44)
(5,4)-(14,64)
(5,13)-(14,62)
(5,16)-(14,62)
(6,3)-(14,62)
(7,3)-(14,62)
(8,3)-(14,62)
(10,7)-(11,62)
(11,7)-(11,62)
(11,20)-(11,25)
(11,20)-(11,29)
(11,26)-(11,27)
(11,33)-(11,62)
(11,38)-(11,61)
(11,39)-(11,50)
(11,51)-(11,57)
(22,3)-(31,35)
(22,12)-(30,69)
(23,5)-(30,69)
(23,11)-(28,73)
(23,13)-(28,73)
(26,11)-(28,73)
(26,18)-(26,19)
(30,5)-(30,69)
(30,16)-(30,18)
(30,36)-(30,50)
(30,36)-(30,62)
(30,51)-(30,52)
(30,58)-(30,62)
(31,14)-(31,35)
(31,15)-(31,18)
(31,19)-(31,34)
(31,20)-(31,27)
*)
