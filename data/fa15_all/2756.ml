
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> i * h
       | _ -> [remainder h i] @ (((i * h) / 10) + (mulByDigit i t)));;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> [i * h]
       | _ -> (remainder h i) :: (mulByDigit i t));;

*)

(* changed spans
(9,14)-(9,19)
[i * h]
ListG (BopG EmptyG EmptyG) Nothing

(10,14)-(10,29)
(remainder h
           i) :: (mulByDigit i t)
ConAppG (Just (TupleG (fromList [AppG (fromList [VarG])]))) Nothing

*)
