LetG NonRec [CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)]] (AppG [EmptyG,EmptyG,EmptyG])
let base =
  match xs with
  | [] -> 4
  | hd :: tl -> f (f 2 hd) tl in
List.fold_left f base xs
