
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          if o = 0
          then (if x < 10 then (0, (x :: l)) else (1, (l :: (x mod 10))))
          else
            if (x + 1) < 10
            then (0, ((x + 1) :: l))
            else (1, ((x + (1 mod 10)) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          if o = 0
          then (if x < 10 then (0, (l @ [x])) else (1, (l @ [x mod 10])))
          else
            if (x + 1) < 10
            then (0, ((x + 1) :: l))
            else (1, ((x + (1 mod 10)) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,37)-(22,38)
(22,37)-(22,43)
(22,42)-(22,43)
(22,52)-(22,70)
(22,56)-(22,57)
(22,56)-(22,70)
(22,62)-(22,70)
(32,20)-(32,27)
(32,28)-(32,30)
(32,31)-(32,33)
*)

(* type error slice
(22,17)-(22,70)
(22,17)-(22,70)
(22,33)-(22,43)
(22,37)-(22,43)
(22,37)-(22,43)
(22,42)-(22,43)
(22,52)-(22,70)
(22,56)-(22,57)
(22,56)-(22,70)
(22,56)-(22,70)
(22,56)-(22,70)
(22,62)-(22,70)
*)
