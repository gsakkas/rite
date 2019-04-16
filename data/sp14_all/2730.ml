
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t ->
               let sum = (h + z) + y in
               let result = (intlist sum) @ t in
               if sum < 10 then 0 :: result else result) in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec intlist x = if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
  match l with
  | [] -> [0]
  | h::t ->
      let zeroList =
        match t with
        | [] -> []
        | h'::t' -> (match padZero t [0] with | (a,b) -> b) in
      let mult = intlist (h * i) in
      let res = mult @ zeroList in bigAdd res (mulByDigit i t);;

let bigMul l1 l2 =
  let f a x =
    match a with | (b,c) -> ((b @ [0]), (bigAdd ((mulByDigit x l2) @ b) c)) in
  let base = ([], 0) in
  let args = l1 in let res = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

let padZero l1 l2 =
  let num1 = (List.length l2) - (List.length l1) in
  let num2 = (List.length l1) - (List.length l2) in
  (((clone 0 num1) @ l1), ((clone 0 num2) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let rec intlist x =
        if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
      match x with
      | (z,y) ->
          (match a with
           | [] -> let sum = z + y in intlist sum
           | h::t ->
               let sum = (h + z) + y in
               let result = (intlist sum) @ t in
               if sum < 10 then 0 :: result else result) in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec intlist x = if x < 10 then [x] else (intlist (x / 10)) @ [x mod 10] in
  match l with
  | [] -> [0]
  | h::t ->
      let zeroList =
        match t with
        | [] -> []
        | h'::t' -> (match padZero t [0] with | (a,b) -> b) in
      let mult = intlist (h * i) in
      let res = mult @ zeroList in bigAdd res (mulByDigit i t);;

let bigMul l1 l2 =
  let f a x =
    match a with | (b,c) -> ((b @ [0]), (bigAdd ((mulByDigit x l2) @ b) c)) in
  let base = ([], [0]) in
  let args = l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(48,19)-(48,20)
[0]
ListG (fromList [LitG])

(49,20)-(49,63)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec (fromList [(TuplePatG (fromList [VarPatG,WildPatG]),AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(13,3)-(13,70)
(13,9)-(13,10)
(13,37)-(13,70)
(13,51)-(13,61)
(13,51)-(13,63)
(13,69)-(13,70)
(15,4)-(31,37)
(15,12)-(31,35)
(15,15)-(31,35)
(16,3)-(31,35)
(31,3)-(31,13)
(31,3)-(31,35)
(46,3)-(49,63)
(46,9)-(47,76)
(46,11)-(47,76)
(47,5)-(47,76)
(47,29)-(47,76)
(47,41)-(47,75)
(47,42)-(47,48)
(48,3)-(49,63)
(48,14)-(48,21)
(48,19)-(48,20)
(49,30)-(49,44)
(49,30)-(49,56)
(49,45)-(49,46)
(49,47)-(49,51)
*)
