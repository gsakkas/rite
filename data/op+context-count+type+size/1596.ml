
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
    let base = (0, l1) in
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
(23,11)-(28,70)
(23,13)-(28,70)
(24,7)-(28,70)
(24,13)-(24,14)
(26,12)-(28,70)
(26,18)-(26,19)
(28,20)-(28,22)
(28,20)-(28,27)
(28,20)-(28,36)
(28,20)-(28,42)
(28,20)-(28,70)
(28,25)-(28,27)
(28,31)-(28,36)
(28,40)-(28,42)
(28,48)-(28,70)
(29,5)-(30,69)
(31,3)-(31,33)
*)

(* type error slice
(3,37)-(3,42)
(3,37)-(3,51)
(3,43)-(3,44)
(3,46)-(3,51)
(5,4)-(14,64)
(5,13)-(14,61)
(5,16)-(14,61)
(6,3)-(14,61)
(6,17)-(6,28)
(6,17)-(6,31)
(6,29)-(6,31)
(7,3)-(14,61)
(7,17)-(7,28)
(7,17)-(7,31)
(7,29)-(7,31)
(8,3)-(14,61)
(10,7)-(11,60)
(10,15)-(10,32)
(11,7)-(11,60)
(11,20)-(11,25)
(11,20)-(11,29)
(11,26)-(11,27)
(11,28)-(11,29)
(11,34)-(11,36)
(11,34)-(11,60)
(11,39)-(11,50)
(11,39)-(11,60)
(11,51)-(11,57)
(11,58)-(11,60)
(22,3)-(31,33)
(22,12)-(30,69)
(23,5)-(30,69)
(23,11)-(28,70)
(23,13)-(28,70)
(24,7)-(28,70)
(24,13)-(24,14)
(26,12)-(28,70)
(26,18)-(26,19)
(28,20)-(28,36)
(28,20)-(28,42)
(28,20)-(28,70)
(28,31)-(28,36)
(28,48)-(28,70)
(29,5)-(30,69)
(29,17)-(29,18)
(29,17)-(29,22)
(29,20)-(29,22)
(30,5)-(30,69)
(30,16)-(30,18)
(30,22)-(30,69)
(30,36)-(30,50)
(30,36)-(30,62)
(30,51)-(30,52)
(30,53)-(30,57)
(30,58)-(30,62)
(30,66)-(30,69)
(31,15)-(31,18)
(31,15)-(31,33)
(31,20)-(31,27)
(31,20)-(31,33)
(31,28)-(31,30)
(31,31)-(31,33)
*)
