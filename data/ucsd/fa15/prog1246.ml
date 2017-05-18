
type 'a option =
  | None
  | Some of 'a;;

let lift1 f xo = match xo with | None  -> None | Some x -> Some (f x);;

let _ = lift1 (!) (Some 2);;
