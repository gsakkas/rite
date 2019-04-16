
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
      | (0,[]) -> (0, [])
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
(23,5)-(31,69)
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
(22,3)-(32,35)
(22,12)-(31,69)
(23,5)-(31,69)
(23,11)-(29,73)
(23,13)-(29,73)
(27,11)-(29,73)
(27,18)-(27,19)
(31,5)-(31,69)
(31,16)-(31,18)
(31,36)-(31,50)
(31,36)-(31,62)
(31,51)-(31,52)
(31,58)-(31,62)
(32,14)-(32,35)
(32,15)-(32,18)
(32,19)-(32,34)
(32,20)-(32,27)
*)
