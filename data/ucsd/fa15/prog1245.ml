
type 'a option =
  | None
  | Some of 'a;;

let lift2 f xo yo =
  match (xo, yo) with | (Some x,Some y) -> Some (f xo yo) | (_,_) -> None;;

let _ = lift2 (+) (Some 1) (Some 10);;
