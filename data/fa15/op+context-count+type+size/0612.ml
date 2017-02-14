
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
(20,6)-(30,27)
(20,12)-(20,13)
(22,10)-(24,69)
(22,17)-(22,18)
(23,44)-(23,58)
(23,44)-(23,63)
(23,45)-(23,46)
(23,49)-(23,51)
(23,54)-(23,56)
(23,62)-(23,63)
(24,43)-(24,63)
(24,44)-(24,45)
(24,47)-(24,62)
(24,48)-(24,57)
(24,49)-(24,51)
(24,54)-(24,56)
(24,60)-(24,61)
(24,67)-(24,68)
(26,10)-(30,27)
(26,17)-(26,18)
(27,51)-(27,72)
(27,51)-(28,23)
(27,52)-(27,53)
(27,55)-(27,71)
(27,56)-(27,65)
(27,57)-(27,59)
(27,62)-(27,64)
(27,68)-(27,70)
(28,15)-(28,17)
(28,15)-(28,23)
(28,21)-(28,23)
(29,50)-(29,77)
(29,50)-(30,26)
(29,51)-(29,52)
(29,54)-(29,76)
(29,56)-(29,65)
(29,57)-(29,59)
(29,62)-(29,64)
(29,68)-(29,70)
(29,74)-(29,75)
(30,18)-(30,20)
(30,18)-(30,26)
(30,24)-(30,26)
(31,4)-(33,51)
(31,15)-(31,17)
(32,4)-(33,51)
(33,4)-(33,51)
(34,2)-(34,34)
*)

(* type error slice
(19,4)-(33,51)
(19,10)-(30,27)
(20,6)-(30,27)
(20,12)-(20,13)
(23,44)-(23,63)
(23,62)-(23,63)
(33,4)-(33,51)
(33,18)-(33,32)
(33,18)-(33,44)
(33,33)-(33,34)
*)
