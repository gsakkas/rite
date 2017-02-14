
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
      | (h1::t1,[]) ->
          let h2::t2 = (List.rev h1) :: t1 in
          ((List.rev t2), [(h2 + x) / 10; (h2 + x) mod 10])
      | (h1::t1,rh::rt) ->
          let h2::t2 = (List.rev h1) :: t1 in
          ((List.rev t2), ((((h2 + x) + rh) / 10) :: (((h2 + x) + rh) mod 10)
            :: rt)) in
    let base = (l1, []) in
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
  let add (l1,l2) =
    let f a x =
      match a with
      | (h1::t1,[]) ->
          let h2::t2 = List.rev (h1 :: t1) in
          ((List.rev t2), [(h2 + x) / 10; (h2 + x) mod 10])
      | (h1::t1,rh::rt) ->
          let h2::t2 = List.rev (h1 :: t1) in
          ((List.rev t2), ((((h2 + x) + rh) / 10) :: (((h2 + x) + rh) mod 10)
            :: rt)) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(26,23)-(26,42)
(26,33)-(26,35)
(29,23)-(29,42)
(29,33)-(29,35)
*)

(* type error slice
(5,3)-(14,63)
(5,12)-(14,61)
(5,15)-(14,61)
(6,2)-(14,61)
(7,2)-(14,61)
(8,2)-(14,61)
(10,6)-(11,61)
(11,6)-(11,61)
(11,6)-(11,61)
(11,19)-(11,24)
(11,19)-(11,28)
(11,32)-(11,61)
(11,33)-(11,35)
(11,37)-(11,60)
(11,38)-(11,49)
(11,50)-(11,56)
(14,6)-(14,61)
(14,19)-(14,24)
(14,19)-(14,28)
(14,33)-(14,56)
(14,34)-(14,45)
(14,46)-(14,52)
(14,53)-(14,55)
(22,2)-(34,34)
(22,11)-(33,68)
(23,4)-(33,68)
(23,10)-(31,19)
(23,12)-(31,19)
(24,6)-(31,19)
(24,6)-(31,19)
(24,12)-(24,13)
(26,10)-(27,59)
(26,10)-(27,59)
(26,23)-(26,36)
(26,23)-(26,42)
(26,23)-(26,42)
(26,24)-(26,32)
(26,33)-(26,35)
(27,27)-(27,35)
(27,27)-(27,35)
(27,28)-(27,30)
(27,33)-(27,34)
(27,42)-(27,50)
(27,43)-(27,45)
(29,10)-(31,19)
(29,10)-(31,19)
(29,23)-(29,36)
(29,23)-(29,42)
(29,23)-(29,42)
(29,24)-(29,32)
(30,29)-(30,37)
(30,30)-(30,32)
(30,55)-(30,63)
(30,56)-(30,58)
(32,4)-(33,68)
(32,15)-(32,23)
(32,16)-(32,18)
(33,4)-(33,68)
(33,15)-(33,17)
(33,35)-(33,49)
(33,35)-(33,61)
(33,50)-(33,51)
(33,52)-(33,56)
(33,57)-(33,61)
(34,13)-(34,34)
(34,14)-(34,17)
(34,18)-(34,33)
(34,19)-(34,26)
*)
