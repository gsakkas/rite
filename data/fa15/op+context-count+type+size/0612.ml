
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] ->
          (match x with
           | (x1,x2) when (x1 + x2) <= 9 -> (0, (x1 + x2)) :: a
           | (x1,x2) when (x1 + x2) > 9 -> (1, ((x1 + x2) - 9)) :: a)
      | (h1::t1,h2::t2) ->
          (match x with
           | (x1,x2) when ((x1 + x2) + h1) <= 9 -> (0, ((x1 + x2) + h1)) ::
               h2 :: t2
           | (x1,x2) when ((x1 + x2) + h1) > 9 -> (1, (((x1 + x2) + h1) - 9))
               :: h2 :: t2) in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (sum / 10) :: (sum mod 10) :: a
      | h::t -> (sum / 10) :: (h + (sum mod 10)) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,7)-(30,27)
(20,13)-(20,14)
(22,12)-(24,69)
(22,18)-(22,19)
(23,46)-(23,47)
(23,46)-(23,57)
(23,46)-(23,64)
(23,50)-(23,52)
(23,55)-(23,57)
(23,63)-(23,64)
(24,45)-(24,46)
(24,45)-(24,62)
(24,50)-(24,52)
(24,50)-(24,57)
(24,50)-(24,62)
(24,55)-(24,57)
(24,61)-(24,62)
(24,68)-(24,69)
(26,12)-(30,27)
(26,18)-(26,19)
(27,53)-(27,54)
(27,53)-(27,71)
(27,53)-(28,24)
(27,58)-(27,60)
(27,58)-(27,65)
(27,58)-(27,71)
(27,63)-(27,65)
(27,69)-(27,71)
(28,16)-(28,18)
(28,16)-(28,24)
(28,22)-(28,24)
(29,52)-(29,53)
(29,52)-(29,76)
(29,52)-(30,27)
(29,58)-(29,60)
(29,58)-(29,65)
(29,58)-(29,76)
(29,63)-(29,65)
(29,69)-(29,71)
(29,75)-(29,76)
(30,19)-(30,21)
(30,19)-(30,27)
(30,25)-(30,27)
(31,5)-(33,52)
(31,16)-(31,18)
(32,5)-(33,52)
(33,5)-(33,52)
(34,3)-(34,33)
*)

(* type error slice
(19,5)-(33,52)
(19,11)-(30,27)
(20,7)-(30,27)
(20,13)-(20,14)
(23,46)-(23,64)
(23,63)-(23,64)
(33,5)-(33,52)
(33,19)-(33,33)
(33,19)-(33,45)
(33,34)-(33,35)
*)
