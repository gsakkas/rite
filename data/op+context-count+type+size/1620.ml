
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
(26,25)-(26,43)
(26,34)-(26,36)
(29,25)-(29,43)
(29,34)-(29,36)
*)

(* type error slice
(5,4)-(14,64)
(5,13)-(14,61)
(5,16)-(14,61)
(6,3)-(14,61)
(7,3)-(14,61)
(8,3)-(14,61)
(10,7)-(11,60)
(11,7)-(11,60)
(11,7)-(11,60)
(11,20)-(11,25)
(11,20)-(11,29)
(11,34)-(11,36)
(11,34)-(11,60)
(11,39)-(11,50)
(11,39)-(11,60)
(11,51)-(11,57)
(14,7)-(14,61)
(14,20)-(14,25)
(14,20)-(14,29)
(14,35)-(14,46)
(14,35)-(14,56)
(14,47)-(14,53)
(14,54)-(14,56)
(22,3)-(34,33)
(22,12)-(33,69)
(23,5)-(33,69)
(23,11)-(31,18)
(23,13)-(31,18)
(24,7)-(31,18)
(24,7)-(31,18)
(24,13)-(24,14)
(26,11)-(27,59)
(26,11)-(27,59)
(26,25)-(26,33)
(26,25)-(26,36)
(26,25)-(26,43)
(26,25)-(26,43)
(26,34)-(26,36)
(27,29)-(27,31)
(27,29)-(27,35)
(27,29)-(27,35)
(27,34)-(27,35)
(27,44)-(27,46)
(27,44)-(27,50)
(29,11)-(31,18)
(29,11)-(31,18)
(29,25)-(29,33)
(29,25)-(29,36)
(29,25)-(29,43)
(29,25)-(29,43)
(30,31)-(30,33)
(30,31)-(30,37)
(30,57)-(30,59)
(30,57)-(30,63)
(32,5)-(33,69)
(32,17)-(32,19)
(32,17)-(32,23)
(33,5)-(33,69)
(33,16)-(33,18)
(33,36)-(33,50)
(33,36)-(33,62)
(33,51)-(33,52)
(33,53)-(33,57)
(33,58)-(33,62)
(34,15)-(34,18)
(34,15)-(34,33)
(34,20)-(34,27)
(34,20)-(34,33)
*)
