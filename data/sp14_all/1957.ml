
let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = mulHelper List.rev (0 :: l) in ans;;


(* fix

let rec mulByDigit i l =
  let rec mulHelper l' =
    match l' with
    | [] -> (0, [])
    | h::t ->
        let (carry,rest) = mulHelper t in
        let prod = (i * h) + carry in ((prod / 10), ((prod mod 10) :: rest)) in
  let (_,ans) = mulHelper (List.rev (0 :: l)) in ans;;

*)

(* changed spans
(9,16)-(9,43)
mulHelper (List.rev (0 :: l))
AppG (fromList [AppG (fromList [EmptyG])])

(9,26)-(9,34)
List.rev (0 :: l)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG,LitG]))) Nothing])

*)
