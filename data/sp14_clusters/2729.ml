
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
    match a with | (b,c) -> ((b @ [0]), (bigAdd ((mulByDigit x l2) @ b) a)) in
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
(47,72)-(47,73)
c
VarG

(48,18)-(48,19)
[0]
ListG LitG Nothing

(49,19)-(49,62)
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec [AppG [EmptyG,EmptyG,EmptyG]] VarG

*)
