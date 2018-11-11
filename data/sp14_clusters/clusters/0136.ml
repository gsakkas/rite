LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG),(Nothing,EmptyG)])
fun l ->
  match l with
  | x :: [] -> []
  | hd :: tl -> hd :: (removeLast tl)
  | [] -> []
fun l ->
  match l with
  | x :: [] -> []
  | hd :: tl -> hd :: (removeLast tl)
  | [] -> []
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
  | _ -> (-1)
