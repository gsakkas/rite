
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
      | (z,y)::t ->
          (match x with
           | (x1,x2) when ((x1 + x2) + z) <= 9 -> (0, ((x1 + x2) + z)) :: a
           | (x1,x2) when ((x1 + x2) + z) > 9 -> (1, (((x1 + x2) + z) - 9))
               :: a) in
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
(20,6)-(29,20)
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
(26,10)-(29,20)
(26,17)-(26,18)
(27,50)-(27,70)
(27,50)-(27,75)
(27,51)-(27,52)
(27,54)-(27,69)
(27,55)-(27,64)
(27,56)-(27,58)
(27,61)-(27,63)
(27,67)-(27,68)
(27,74)-(27,75)
(28,49)-(28,75)
(28,50)-(28,51)
(28,53)-(28,74)
(28,54)-(28,69)
(28,55)-(28,64)
(28,56)-(28,58)
(28,61)-(28,63)
(28,67)-(28,68)
(28,72)-(28,73)
(29,18)-(29,19)
(30,4)-(32,51)
(30,15)-(30,17)
(31,4)-(32,51)
(32,4)-(32,51)
(32,48)-(32,51)
(33,2)-(33,34)
*)

(* type error slice
(19,4)-(32,51)
(19,10)-(29,20)
(23,44)-(23,63)
(23,62)-(23,63)
(32,4)-(32,51)
(32,18)-(32,32)
(32,18)-(32,44)
(32,33)-(32,34)
*)
