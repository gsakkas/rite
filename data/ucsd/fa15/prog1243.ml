
type 'a option =
  | None
  | Some of 'a;;

let rec lookup k kvs =
  match kvs with
  | [] -> None
  | (c,v)::tl -> if c = k then Some v else lookup k tl;;

let _ = lookup "a" [("a", 1); (("b", 2), ("a", 10))];;
