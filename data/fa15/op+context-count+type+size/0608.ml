
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
(20,7)-(29,20)
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
(26,12)-(29,20)
(26,18)-(26,19)
(27,52)-(27,53)
(27,52)-(27,69)
(27,52)-(27,76)
(27,57)-(27,59)
(27,57)-(27,64)
(27,57)-(27,69)
(27,62)-(27,64)
(27,68)-(27,69)
(27,75)-(27,76)
(28,51)-(28,52)
(28,51)-(28,74)
(28,57)-(28,59)
(28,57)-(28,64)
(28,57)-(28,69)
(28,57)-(28,74)
(28,62)-(28,64)
(28,68)-(28,69)
(28,73)-(28,74)
(29,19)-(29,20)
(30,5)-(32,52)
(30,16)-(30,18)
(31,5)-(32,52)
(32,5)-(32,52)
(32,49)-(32,52)
(33,3)-(33,33)
*)

(* type error slice
(19,5)-(32,52)
(19,11)-(29,20)
(23,46)-(23,64)
(23,63)-(23,64)
(32,5)-(32,52)
(32,19)-(32,33)
(32,19)-(32,45)
(32,34)-(32,35)
*)
